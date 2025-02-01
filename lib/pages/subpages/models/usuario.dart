class Usuario {
  final int? idUsuario;
  final String nombre;
  final String fotoPerfil; // URL o ruta de la foto
  final String correoElectronico;
  final String numeroTelefono;
  final String direccion;
  final String metodoPago;
  final String numeroTarjeta;
  final String fechaExpiracionTarjeta; // Formato MM/AA
  final String codigoSeguridadTarjeta; // CVV
  final String idiomaPreferido;
  final String zonaHoraria;
  final String unidadesMedida;
  final String privacidadPerfil; // Público/Privado
  final bool compartirDatos;
  final bool autenticacionDosFactores;
  final bool notificacionesNivelesBateria;
  final bool notificacionesEstacionesCercanas;
  final bool notificacionesActualizacionesApp;
  final String frecuenciaNotificaciones; // Inmediato/Diario/Semanal
  final String redesSociales; // JSON o lista separada por comas
  final String planSuscripcion;
  final String historialFacturacion; // JSON o lista separada por comas

  Usuario({
    this.idUsuario,
    required this.nombre,
    required this.fotoPerfil,
    required this.correoElectronico,
    required this.numeroTelefono,
    required this.direccion,
    required this.metodoPago,
    required this.numeroTarjeta,
    required this.fechaExpiracionTarjeta,
    required this.codigoSeguridadTarjeta,
    required this.idiomaPreferido,
    required this.zonaHoraria,
    required this.unidadesMedida,
    required this.privacidadPerfil,
    required this.compartirDatos,
    required this.autenticacionDosFactores,
    required this.notificacionesNivelesBateria,
    required this.notificacionesEstacionesCercanas,
    required this.notificacionesActualizacionesApp,
    required this.frecuenciaNotificaciones,
    required this.redesSociales,
    required this.planSuscripcion,
    required this.historialFacturacion,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'foto_perfil': fotoPerfil,
      'correo_electronico': correoElectronico,
      'numero_telefono': numeroTelefono,
      'direccion': direccion,
      'metodo_pago': metodoPago,
      'numero_tarjeta': numeroTarjeta,
      'fecha_expiracion_tarjeta': fechaExpiracionTarjeta,
      'codigo_seguridad_tarjeta': codigoSeguridadTarjeta,
      'idioma_preferido': idiomaPreferido,
      'zona_horaria': zonaHoraria,
      'unidades_medida': unidadesMedida,
      'privacidad_perfil': privacidadPerfil,
      'compartir_datos': compartirDatos,
      'autenticacion_dos_factores': autenticacionDosFactores,
      'notificaciones_niveles_bateria': notificacionesNivelesBateria,
      'notificaciones_estaciones_cercanas': notificacionesEstacionesCercanas,
      'notificaciones_actualizaciones_app': notificacionesActualizacionesApp,
      'frecuencia_notificaciones': frecuenciaNotificaciones,
      'redes_sociales': redesSociales,
      'plan_suscripcion': planSuscripcion,
      'historial_facturacion': historialFacturacion,
    };
  }
}
