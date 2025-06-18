import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? generateInvateCode() {
  var rng = new math.Random();
  var code = rng.nextInt(900000) + 100000;
  return code.toString();
}

List<String>? getJsonKeys(dynamic jsonData) {
  if (jsonData == null) return [];
  Map<String, dynamic> data;
  if (jsonData is String) {
    data = json.decode(jsonData);
  } else if (jsonData is Map<String, dynamic>) {
    data = jsonData;
  } else {
    return [];
  }
  return data.keys.toList();
}

List<String>? getSubcategories(
  dynamic jsonData,
  String mainCategoryKey,
) {
  if (jsonData == null || mainCategoryKey.isEmpty) return [];
  Map<String, dynamic> data;
  if (jsonData is String) {
    data = json.decode(jsonData);
  } else if (jsonData is Map<String, dynamic>) {
    data = jsonData;
  } else {
    return [];
  }
  if (data.containsKey(mainCategoryKey) && data[mainCategoryKey] is List) {
    return List<String>.from(data[mainCategoryKey]);
  }
  return [];
}
