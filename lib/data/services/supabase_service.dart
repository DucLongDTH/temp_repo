// import 'package:flutter/material.dart';
// import 'package:supabase/supabase.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// const String supabaseUrl = "your supabase url goes here ";
// const String token = "your supabase token goes here";

// class SupabaseManager {
//   // final client = SupabaseClient(supabaseUrl, token);

//   Future<void> signUpUser({String? email, String? phone}) async {
//     try {
//       final result =
//           await Supabase.instance.client.auth.signInWithOtp(email: email);
//     } catch (e) {
//       var rs =e;
//     }
//   }

//   // Future<void> signInUser(context, {String? email, String? password}) async {
//   //   debugPrint("email:$email password:$password");
//   //   final result = await client.auth.signInWithOtp(email: email!,);
//   // }

//   // Future<void> logout (context)async{
//   //   await client.auth.signOut();
//   //   Navigator.pushReplacementNamed(context, 'login');
//   // }
// }
