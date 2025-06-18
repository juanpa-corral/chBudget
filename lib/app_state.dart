import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _codeResetPass = 0;
  int get codeResetPass => _codeResetPass;
  set codeResetPass(int value) {
    _codeResetPass = value;
  }

  dynamic _categoryMap = jsonDecode(
      '{\"Hogar\":[\"Servicios Públicos\",\"Mercado\",\"Arriendo / Hipoteca\",\"Mantenimiento y Reparaciones\"],\"Transporte\":[\"Combustible\",\"Mantenimiento Vehículo\",\"Parqueaderos\",\"Transporte Público y Apps\",\"Seguros e Impuestos\"],\"Vida y Ocio\":[\"Comida Fuera de Casa\",\"Suscripciones\",\"Compras y Vestuario\",\"Ocio y Recreación\",\"Cuidado Personal\"],\"Viajes\":[\"Vuelos y Tiquetes\",\"Alojamiento\",\"Transporte en Viaje\"],\"Salud y Bienestar\":[\"Salud\",\"Educación\",\"Mascotas\"],\"Finanzas y Obligaciones\":[\"Regalos y Donaciones\",\"Impuestos\",\"Otros Gastos\"],\"Negocios / Empresa\":[\"Gastos de Empresa\"]}');
  dynamic get categoryMap => _categoryMap;
  set categoryMap(dynamic value) {
    _categoryMap = value;
  }

  bool _isOptionExpanded = false;
  bool get isOptionExpanded => _isOptionExpanded;
  set isOptionExpanded(bool value) {
    _isOptionExpanded = value;
  }
}
