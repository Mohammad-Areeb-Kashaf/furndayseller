import 'package:flutter/material.dart';

export 'dart:async';
export 'dart:convert';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:flutter/cupertino.dart' hide RefreshCallback;
export 'package:flutter/foundation.dart' show kIsWeb;
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:get/get.dart';
export 'package:provider/provider.dart';
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:internet_connection_checker/internet_connection_checker.dart';
export 'package:furndayseller/services/network_services.dart';
export 'package:furndayseller/widgets/network_aware_widget.dart';
export 'package:auto_size_text/auto_size_text.dart';
export 'package:furndayseller/screens/no_internet_screen.dart';
export 'package:furndayseller/widgets/internet_checker.dart';
export 'package:furndayseller/screens/main_screens/main_screen.dart';
export 'package:furndayseller/widgets/my_appbar.dart';
export 'package:furndayseller/widgets/main_screen/main_email_not_verified_child.dart';
export 'package:furndayseller/widgets/main_screen/main_email_verified_child.dart';
export 'package:furndayseller/firebase_options.dart';
export 'package:furndayseller/screens/auth_screens/signin_screen.dart';

final kGreyDiscountedPriceColor = Colors.grey.shade600;
const kGreyMRPColor = Color(0xffc8c8c8);
const kGreyTextColor = Color.fromARGB(255, 158, 157, 152);
const kWhiteBackground = Color.fromARGB(255, 248, 247, 243);
const kYellowColor = Color(0xffF6C33C);
const kLightYellowColor = Color(0xfff5e8c4);
const kOrangeColor = Color(0xffF39F86);
final kBorderRadiusCard = BorderRadius.circular(10);
const kRadius = Radius.circular(8);
const kScrollPhysics = BouncingScrollPhysics();
const kHighlightColor = Color(0xffF7CC59);
const kProductMRPTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  decoration: TextDecoration.lineThrough,
  color: kGreyMRPColor,
);
const kProductDiscountPriceTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: kGreyTextColor,
);
