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

String platformConcatenate(EntryRecord doc) {
  final a = doc.ps5 ? "PS5" : "";
  final b = doc.ps4 ? "PS4" : "";
  final sep = doc.ps5 && doc.ps4 ? "/" : "";
  return a + sep + b;
}
