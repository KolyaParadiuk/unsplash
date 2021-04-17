import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

NavigatorState useNavigation() => Navigator.of(useContext());
