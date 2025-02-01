import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:phase_mobil/app_body.dart';
import 'package:phase_mobil/components/my_button.dart';
import 'package:phase_mobil/components/my_textfield.dart';
import 'package:url_launcher/url_launcher.dart'; // Para abrir el navegador

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String? verificationId; // Para almacenar el ID de verificación

  // Método para registrar un nuevo usuario
  void registerUser(BuildContext context) async {
    if (usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa tu correo electrónico.')),
      );
      return; // Salir del método si el campo está vacío
    }
    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa tu contraseña.')),
      );
      return; // Salir del método si el campo está vacío
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AppBody()),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de registro: ${e.toString()}')),
      );
    }
  }

  // Método para iniciar sesión con correo electrónico y contraseña
  void logUserIn(BuildContext context) async {
    if (usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa tu correo electrónico.')),
      );
      return; // Salir del método si el campo está vacío
    }
    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa tu contraseña.')),
      );
      return; // Salir del método si el campo está vacío
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AppBody()),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de inicio de sesión: ${e.toString()}')),
      );
    }
  }

  // Método para recuperar la contraseña por correo electrónico
  void recoverPassword(BuildContext context) async {
    if (usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa tu correo electrónico.')),
      );
      return; // Salir del método si el campo está vacío
    }

    try {
      await _auth.sendPasswordResetEmail(email: usernameController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correo de recuperación enviado.')),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al enviar el correo: ${e.toString()}')),
      );
    }
  }

  // Método para enviar el código SMS para autenticación telefónica
  Future<void> enviarCodigoSMS(BuildContext context) async {
    if (phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa tu número de teléfono.')),
      );
      return; // Salir del método si el campo está vacío
    }

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Si se verifica automáticamente, inicia sesión con el credential
          await _auth.signInWithCredential(credential);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AppBody()),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Error en la verificación: ${e.message}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error en la verificación: ${e.message}')),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId; // Guardar el ID de verificación
          print('Código enviado');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Código SMS enviado.')),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
        },
      );
    } catch (e) {
      print('Error al enviar el código SMS: $e');
    }
  }

  // Método para verificar el código SMS
  Future<void> verificarCodigoSMS(BuildContext context) async {
    if (verificationId == null || phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa el código SMS.')),
      );
      return; // Salir del método si hay campos vacíos o no se ha enviado un código
    }

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: phoneController.text,
      );

      await _auth.signInWithCredential(credential);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AppBody()),
      );
    } catch (e) {
      print('Error al verificar el código SMS: $e');
    }
  }

  // Método para iniciar sesión con Google
  void loginWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AppBody()),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al iniciar sesión con Google: ${e.toString()}')),
      );
    }
  }

  // Método para iniciar sesión con Facebook
  void loginWithFacebook(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      
     if (result.status == LoginStatus.success) {
       final AccessToken accessToken = result.accessToken!;
       final credential = FacebookAuthProvider.credential(accessToken.token);

       UserCredential userCredential = await _auth.signInWithCredential(credential);
       
       Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context) => const AppBody()),
       );
     } else {
       print(result.status);
       print(result.message);
     }
   } catch (e) {
     print(e);
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Error al iniciar sesión con Facebook: ${e.toString()}')),
     );
   }
}

@override
Widget build(BuildContext context) {
   return Scaffold(
     body : Center(
       child : Column(
         children : [
           const SizedBox(height :100),
           const Image(image : AssetImage('assets/phase-icon.png'), height :150, width :150),
           const SizedBox(height :50),
           MyTextField(
             controller : usernameController,
             hintText : 'email',
             obscureText : false,
           ),
           const SizedBox(height :25),
           MyTextField(
             controller : passwordController,
             hintText : 'contraseña',
             obscureText : true,
           ),
           const SizedBox(height :25),
           MyTextField(
             controller : phoneController,
             hintText : 'número de teléfono',
             obscureText : false,
           ),
           const SizedBox(height :25),
           Padding(
             padding : const EdgeInsets.symmetric(horizontal :25.0),
             child : Row(
               mainAxisAlignment : MainAxisAlignment.end,
               children : [
                 TextButton(
                   onPressed : () => recoverPassword(context), // Recuperación por correo electrónico
                   child : const Text(
                     '¿olvidaste la contraseña?',
                     style : TextStyle(color : Color.fromRGBO(53, 184, 134, 1)),
                   ),
                 ),
               ],
             ),
           ),
           const SizedBox(height :25),
           MyButton(
             buttonColor : const Color.fromRGBO(53, 184, 134, 1),
             buttonText : 'Iniciar sesión',
             onTap : () => logUserIn(context),
           ),
           const SizedBox(height :25),
           MyButton(
             buttonColor : Colors.greenAccent,
             buttonText : 'Enviar Código SMS',
             onTap : () => enviarCodigoSMS(context), // Llama a enviar código SMS
           ),
           const SizedBox(height :25),
           MyButton(
             buttonColor : Colors.greenAccent,
             buttonText : 'Verificar Código',
             onTap : () => verificarCodigoSMS(context), // Llama a verificar el código SMS
           ),
           const SizedBox(height :25),
           // Botón de inicio de sesión con Google
           MyButton(
             buttonColor : Colors.blue,
             buttonText : 'Iniciar sesión con Google',
             onTap : () => loginWithGoogle(context),
           ),
           const SizedBox(height :25),
           // Botón de inicio de sesión con Facebook
           MyButton(
             buttonColor : Colors.blueAccent,
             buttonText : 'Iniciar sesión con Facebook',
             onTap : () => loginWithFacebook(context),
           ),
           const SizedBox(height :25),
           // Botón de inicio de sesión con Instagram
           MyButton(
             buttonColor : Colors.purple,
             buttonText : 'Iniciar sesión con Instagram',
             onTap : () => loginWithInstagram(context),
           ),
           const SizedBox(height :25),
           const Padding(
             padding : EdgeInsets.symmetric(horizontal :25),
             child :
                 Row(children:[
                   Expanded(child:
                     Divider(thickness :
                       .5,color :
                       Colors.grey)),
                   Padding(padding :
                     EdgeInsets.symmetric(horizontal :
                       25),child :
                     Text('¿No tienes una cuenta?',style :
                       TextStyle(color :
                       Colors.grey))),
                   Expanded(child:
                     Divider(thickness :
                       .5,color :
                       Colors.grey))
                 ]),
            ),
            const SizedBox(height :
              .25),
            MyButton(buttonColor:
              Colors.grey,buttonText:
              'Registrar',onTap:
              () => registerUser(context)),
         ],
       ),
     ),
   );
}
}



