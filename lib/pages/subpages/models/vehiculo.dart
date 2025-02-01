class Vehiculo {
  final int? idVehiculo;
  final int idUsuario;
  final String marca;
  final String modelo;
  final int anoFabricacion;
  final String numeroMatricula;
  final double capacidadBateria;
  final double autonomia;
  final double potenciaMotor;
  final double velocidadMaxima;
  final double tiempoCarga;
  final String tipoConector;
  final double kilometrajeActual;
  final DateTime fechaUltimoServicio;
  final DateTime proximoServicio;
  final DateTime fechaExpiracionSeguro;
  final String preferenciasCarga;
  final String configuracionClimatizacion;
  final String modosConduccion;
  final String color;
  final String vin;
  final String fotoVehiculo; // URL o ruta de la foto
  final String notasAdicionales;

  Vehiculo({
    this.idVehiculo,
    required this.idUsuario,
    required this.marca,
    required this.modelo,
    required this.anoFabricacion,
    required this.numeroMatricula,
    required this.capacidadBateria,
    required this.autonomia,
    required this.potenciaMotor,
    required this.velocidadMaxima,
    required this.tiempoCarga,
    required this.tipoConector,
    required this.kilometrajeActual,
    required this.fechaUltimoServicio,
    required this.proximoServicio,
    required this.fechaExpiracionSeguro,
    required this.preferenciasCarga,
    required this.configuracionClimatizacion,
    required this.modosConduccion,
    required this.color,
    required this.vin,
    required this.fotoVehiculo,
    required this.notasAdicionales,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_usuario': idUsuario,
      'marca': marca,
      'modelo': modelo,
      'ano_fabricacion': anoFabricacion,
      'numero_matricula': numeroMatricula,
      'capacidad_bateria': capacidadBateria,
      'autonomia': autonomia,
      'potencia_motor': potenciaMotor,
      'velocidad_maxima': velocidadMaxima,
      'tiempo_carga': tiempoCarga,
      'tipo_conector': tipoConector,
      'kilometraje_actual': kilometrajeActual,
      'fecha_ultimo_servicio': fechaUltimoServicio.toIso8601String(),
      'proximo_servicio': proximoServicio.toIso8601String(),
      'fecha_expiracion_seguro': fechaExpiracionSeguro.toIso8601String(),
      'preferencias_carga': preferenciasCarga,
      'configuracion_climatizacion': configuracionClimatizacion,
      'modos_conduccion': modosConduccion,
      'color': color,
      'vin': vin,
      'foto_vehiculo': fotoVehiculo, // URL o ruta de la foto
      'notas_adicionales': notasAdicionales
    };
  }
}
