import 'package:exercises/data/profile_data.dart';
import 'package:flutter/material.dart';
import 'ui/screens/profile.dart';
 
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(profile: ronanProfile),
  ));
}
