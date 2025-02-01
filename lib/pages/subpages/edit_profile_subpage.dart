import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text('Información Personal', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              _buildTextField(label: 'Nombre', hintText: 'Editar Nombre'),
              _buildImagePicker(),
              _buildTextField(label: 'Correo Electrónico', hintText: 'Editar Correo'),
              _buildTextField(label: 'Número de Teléfono', hintText: 'Editar Número'),
              _buildTextField(label: 'Dirección', hintText: 'Editar Dirección'),

              const SizedBox(height: 20),

            
              Text('Preferencias de Pago', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              _buildPaymentMethodDropdown(),
              _buildTextField(label: 'Número de Tarjeta', hintText: 'Editar Número de Tarjeta'),
              _buildTextField(label: 'Fecha de Expiración (MM/AA)', hintText: 'MM/AA'),
              _buildTextField(label: 'Código de Seguridad', hintText: 'CVV'),

              const SizedBox(height: 20),

              
              Text('Preferencias y Configuración', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              _buildDropdown(label: 'Idioma Preferido', items: ['Español', 'Inglés']),
              _buildDropdown(label: 'Zona Horaria', items: ['UTC-5', 'UTC+1']),
              _buildDropdown(label: 'Unidades de Medida', items: ['Millas', 'Kilómetros']),

              const SizedBox(height: 20),

              
              Text('Seguridad y Privacidad', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              _buildPrivacySettings(),
              _buildTwoFactorAuth(),
              
              const SizedBox(height: 20),

              
              Text('Preferencias de Notificaciones', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              _buildNotificationPreferences(),

              const SizedBox(height: 20),

              
              Text('Enlaces de Redes Sociales', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              _buildSocialMediaLinks(),

              const SizedBox(height: 20),

              
              Text('Preferencias de Suscripción y Facturación', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              _buildSubscriptionOptions(),

              const SizedBox(height: 20),

              // Botón para guardar cambios
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para guardar los cambios
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Perfil actualizado')),
                    );
                  },
                  child: const Text('Guardar Cambios'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              // Lógica para subir/editar foto
            },
            child: const Text('Subir/Editar Foto'),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Método de Pago',
          border: OutlineInputBorder(),
        ),
        items:
            ['Tarjeta de Crédito', 'PayPal', 'Transferencia Bancaria'].map((item) => DropdownMenuItem(value:item, child : Text(item))).toList(),
        onChanged:(value) {
          // Esto es para manejar el cambio
        },
      ),
    );
  }

  Widget _buildDropdown({required String label, required List<String> items}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child:
          DropdownButtonFormField<String>(
            decoration:
                InputDecoration(labelText : label,border : OutlineInputBorder()),
            items : items.map((item) => DropdownMenuItem(value:item,child : Text(item))).toList(),
            onChanged :(value){ /* lógica */},
          ),
    );
  }

  Widget _buildPrivacySettings() {
    return Column(
      children:[
        Row(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children : [
            const Text('¿Quién puede ver tu perfil?'),
            DropdownButton<String>(
                items:
                    ['Público', 'Privado'].map((item) => DropdownMenuItem(value:item, child : Text(item))).toList(),
                onChanged:(value) {
                  // Lógica para manejar el cambio
                }),
          ],
        ),
        Row(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children:[
            const Text('Compartir datos con socios'),
            Switch(value:true, onChanged:(value){
               // Lógica para manejar el cambio
            })
          ]
        )
      ],
    );
  }

  Widget _buildTwoFactorAuth() {
    return Row(
      mainAxisAlignment : MainAxisAlignment.spaceBetween,
      children : [
        const Text('Autenticación de Dos Factores'),
        Switch(value:true, onChanged:(value){
           // Lógica para manejar el cambio
        })
      ]
    );
  }

  Widget _buildNotificationPreferences() {
    return Column(
      children : [
         Row(children :[
           Checkbox(value:true, onChanged:(value){ /* lógica */}),
           const Text('Niveles de Batería Baja')
         ]),
         Row(children :[
           Checkbox(value:true, onChanged:(value){ /* lógica */}),
           const Text('Estaciones de Carga Cercanas')
         ]),
         Row(children :[
           Checkbox(value:true, onChanged:(value){ /* lógica */}),
           const Text('Actualizaciones de la App')
         ]),
         DropdownButtonFormField<String>(
           decoration : InputDecoration(labelText:'Frecuencia de Notificaciones',
           border : OutlineInputBorder()),
           items : ['Inmediato','Diario','Semanal'].map((item) => DropdownMenuItem(value:item,child : Text(item))).toList(),
           onChanged :(value){ /* lógica */},
         )
       ]
    );
  }

  Widget _buildSocialMediaLinks() {
    return Column(
      children : [
         ElevatedButton(onPressed : (){ /* lógica para añadir redes */},child :const Text('Añadir Redes')),
         ElevatedButton(onPressed : (){ /* lógica para eliminar redes */},child :const Text('Eliminar Redes')),
       ]
    );
  }

   Widget _buildSubscriptionOptions() {
     return Column(
       children : [
         ElevatedButton(onPressed : (){ /* lógica para ver/editar plan */},child :const Text('Ver/Editar Plan')),
         ElevatedButton(onPressed : (){ /* lógica para ver historial */},child :const Text('Ver Historial')),
         ElevatedButton(onPressed : (){ /* lógica para ver opciones */},child :const Text('Ver Opciones')),
       ]
     );
   }
}

