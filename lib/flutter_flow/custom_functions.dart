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
import '/auth/firebase_auth/auth_util.dart';

double? averageRating(List<int>? ratings) {
  if (ratings == null || ratings.isEmpty) {
    return null;
  }

  double sum = 0;

  for (int rating in ratings) {
    sum += rating;
  }

  return sum / ratings.length;
}

List<String> generateListOfUserName(
  String authUserName,
  String chatUserName,
) {
  return [authUserName, chatUserName];
}

List<DocumentReference> generateListOfUsers(
  DocumentReference authUser,
  DocumentReference chatUser,
) {
  return [authUser, chatUser];
}

String getOtherUserName(
  List<String> listOfMmes,
  String authUserName,
) {
  return authUserName == listOfMmes.first ? listOfMmes.last : listOfMmes.first;
}

DocumentReference getOtherUserRef(
  List<DocumentReference> listOfUserRef,
  DocumentReference authUserRef,
) {
  return authUserRef == listOfUserRef.first
      ? listOfUserRef.last
      : listOfUserRef.first;
}
