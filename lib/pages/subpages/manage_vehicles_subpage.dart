import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; 
import 'api_service.dart'; 
import 'vehiculo.dart'; 

class ManageVehiclesPage extends StatefulWidget {
  const ManageVehiclesPage({super.key});

  @override
  _ManageVehiclesPageState createState() => _ManageVehiclesPageState();
}

class _ManageVehiclesPageState extends State<ManageVehiclesPage> {
  final ApiService apiService = ApiService('https://api_services.com'); 

  
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _anioController = TextEditingController();
  final TextEditingController _matriculaController = TextEditingController();
  final TextEditingController _capacidadController = TextEditingController();
  final TextEditingController _autonomiaController = TextEditingController();
  final TextEditingController _potenciaController = TextEditingController();
  final TextEditingController _velocidadController = TextEditingController();
  final TextEditingController _tiempoCargaController = TextEditingController();
  final TextEditingController _kilometrajeController = TextEditingController();
  final TextEditingController _vinController = TextEditingController();

  DateTime? _fechaUltimoServicio;
  DateTime? _proximoServicio;
  String? _tipoConector;
  String? _preferenciasCarga;
  String? _configuracionClimatizacion;
  String? _modosConduccion;
  String? _colorVehiculo;

  XFile? _fotoVehiculo; // Para almacenar la imagen seleccionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestionar Vehículo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Información General del Vehículo
              Text('Información General del Vehículo', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              _buildTextField(_marcaController, 'Marca', 'Editar Marca'),
              _buildTextField(_modeloController, 'Modelo', 'Editar Modelo'),
              _buildTextField(_anioController, 'Año de Fabricación', 'Editar Año'),
              _buildTextField(_matriculaController, 'Número de Matrícula', 'Editar Matrícula'),

              const SizedBox(height: 20),

              // Información Técnica
              Text('Información Técnica', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              _buildTextField(_capacidadController, 'Capacidad de la Batería (kWh)', 'Editar Capacidad'),
              _buildTextField(_autonomiaController, 'Autonomía (km o millas)', 'Editar Autonomía'),
              _buildTextField(_potenciaController, 'Potencia del Motor (kW)', 'Editar Potencia'),
              _buildTextField(_velocidadController, 'Velocidad Máxima (km/h o mph)', 'Editar Velocidad'),
              _buildTextField(_tiempoCargaController, 'Tiempo de Carga (horas)', 'Editar Tiempo'),
              _buildDropdown(
                label: 'Tipo de Conector',
                items: ['Tipo 1', 'Tipo 2', 'CHAdeMO', 'CCS'],
                onChanged: (value) {
                  setState(() {
                    _tipoConector = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Información de Mantenimiento
              Text('Información de Mantenimiento', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              _buildDatePicker(label: 'Fecha del Último Servicio', onDateSelected: (date) {
                setState(() {
                  _fechaUltimoServicio = date;
                });
              }),
              _buildTextField(_kilometrajeController, 'Kilometraje Actual (km o millas)', 'Editar Kilometraje'),
              _buildDatePicker(label: 'Próximo Servicio Programado', onDateSelected: (date) {
                setState(() {
                  _proximoServicio = date;
                });
              }),

              const SizedBox(height: 20),

              // Configuración del Vehículo
              Text('Configuración del Vehículo', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              _buildDropdown(
                label: 'Preferencias de Carga',
                items: ['Carga Nocturna', 'Carga Rápida'],
                onChanged: (value) {
                  setState(() {
                    _preferenciasCarga = value;
                  });
                },
              ),
              _buildDropdown(
                label: 'Configuración de Climatización',
                items: ['Temperatura Ideal'],
                onChanged: (value) {
                  setState(() {
                    _configuracionClimatizacion = value;
                  });
                },
              ),
              _buildDropdown(
                label: 'Modos de Conducción',
                items: ['Eco', 'Sport', 'Normal'],
                onChanged: (value) {
                  setState(() {
                    _modosConduccion = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Información Adicional
              Text('Información Adicional', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              _buildDropdown(
                label: 'Color del Vehículo',
                items: ['Rojo', 'Azul', 'Verde', 'Negro', 'Blanco'],
                onChanged: (value) {
                  setState(() {
                    _colorVehiculo = value;
                  });
                },
              ),
              _buildTextField(_vinController, 'VIN (Número de Identificación del Vehículo)', 'Editar VIN'),

              // Fotografía del Vehículo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        XFile? image = await picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          if (image != null) {
                            _fotoVehiculo = image;
                          }
                        });
                      },
                      child: const Text('Subir/Editar Foto'),
                    ),
                  ],
                ),
              ),

              // Notas Adicionales
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child:
                    TextField(
                      maxLines : 3,
                      decoration : InputDecoration(
                        labelText : "Notas Adicionales",
                        border : OutlineInputBorder(),
                      ),
                    ),
               ),

               const SizedBox(height : 20),

               // Botón para guardar cambios
               Center(
                 child : ElevatedButton(
                   onPressed : () async {
                     // Obtener los valores de los campos de texto
                     int idUsuario = /* Obtén el ID del usuario */;
                     String marca = _marcaController.text;
                     String modelo = _modeloController.text;
                     int anoFabricacion = int.parse(_anioController.text);
                     String numeroMatricula = _matriculaController.text;
                     double capacidadBateria = double.parse(_capacidadController.text);
                     double autonomia = double.parse(_autonomiaController.text);
                     double potenciaMotor = double.parse(_potenciaController.text);
                     double velocidadMaxima = double.parse(_velocidadController.text);
                     double tiempoCarga = double.parse(_tiempoCargaController.text);
                     double kilometrajeActual = double.parse(_kilometrajeController.text);
                     DateTime fechaExpiracionSeguro = DateTime.now().add(Duration(days :365)); // Ejemplo

                     // Crear una instancia del vehículo
                     Vehiculo vehiculo = Vehiculo(
                       idUsuario : idUsuario,
                       marca : marca,
                       modelo : modelo,
                       anoFabricacion : anoFabricacion,
                       numeroMatricula : numeroMatricula,
                       capacidadBateria : capacidadBateria,
                       autonomia : autonomia,
                       potenciaMotor : potenciaMotor,
                       velocidadMaxima : velocidadMaxima,
                       tiempoCarga : tiempoCarga,
                       tipoConector : _tipoConector!,
                       kilometrajeActual : kilometrajeActual,
                       fechaUltimoServicio : (_fechaUltimoServicio ?? DateTime.now()), 
                       proximoServicio : (_proximoServicio ?? DateTime.now().add(Duration(days :30))), 
                       fechaExpiracionSeguro : fechaExpiracionSeguro,
                       preferenciasCarga : (_preferenciasCarga ?? ''),
                       configuracionClimatizacion : (_configuracionClimatizacion ?? ''),
                       modosConduccion : (_modosConduccion ?? ''),
                       color : (_colorVehiculo ?? ''),
                       vin : (_vinController.text),
                       fotoVehiculo : (_fotoVehiculo?.path ?? ''), // Ruta o URL de la foto
                       notasAdicionales : '', // Aquí puedes capturar las notas adicionales si lo deseas.
                     );

                     // Llamar a la función para enviar datos usando el servicio
                     await apiService.enviarDatos(vehiculo);

                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content : Text('Vehículo actualizado')));
                   },
                   child : const Text('Guardar Cambios'),
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, String hintText) {
    return Padding(
      padding : const EdgeInsets.symmetric(vertical : 8.0),
      child : TextField(
        controller: controller,
        decoration : InputDecoration(
          labelText : label,
          hintText : hintText,
          border : OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDropdown({required String label, required List<String> items, required ValueChanged<String?> onChanged}) {
    return Padding(
      padding : const EdgeInsets.symmetric(vertical : 8.0),
      child :
          DropdownButtonFormField<String>(
            decoration :
                InputDecoration(labelText : label,border : OutlineInputBorder()),
            items :
                items.map((item) => DropdownMenuItem(value:item,child : Text(item))).toList(),
            onChanged:onChanged,
          ),
    );
  }

  Widget _buildDatePicker({required String label, required ValueChanged<DateTime> onDateSelected}) {
    return Padding(
      padding : const EdgeInsets.symmetric(vertical : 8.0),
      child :
          GestureDetector(
            onTap : () async {
               DateTime? pickedDate = await showDatePicker(
                 context : context,
                 initialDate : DateTime.now(),
                 firstDate : DateTime(2000), // Fecha mínima
                 lastDate : DateTime(2101), // Fecha máxima
               );
               if (pickedDate != null) {
                 onDateSelected(pickedDate); // Llama a la función con la fecha seleccionada
               }
            },
            child :
                InputDecorator(
                  decoration :
                      InputDecoration(labelText : label,border : OutlineInputBorder()),
                  child :
                      Row(mainAxisAlignment : MainAxisAlignment.spaceBetween,
                          children:[
                            Text("Seleccionar Fecha"),
                            Icon(Icons.calendar_today)
                          ]
                      )
                )
          )
    );
  }
}
