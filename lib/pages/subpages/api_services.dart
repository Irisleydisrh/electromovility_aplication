import 'package:http/http.dart' as http;
import 'dart:convert';
import 'vehiculo.dart'; // Asegúrate de importar tu modelo

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<void> enviarDatos(Vehiculo vehiculo) async {
    final String url = '$baseUrl/vehiculos'; 

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(vehiculo.toMap()), // Convierte el objeto Vehiculo a JSON
      );

      if (response.statusCode == 200) {
        print('Datos enviados correctamente: ${response.body}');
      } else {
        print('Error al enviar datos: ${response.statusCode}');
      }
    } catch (e) {
      print('Error de conexión: $e');
    }
  }
}
