import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:students_attandance_with_mlkit/firebase_options.dart';
import 'package:students_attandance_with_mlkit/getlocation_screen.dart';
import 'package:students_attandance_with_mlkit/ui/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          cardTheme: CardTheme(
            surfaceTintColor: Colors.white,
          ),
          dialogTheme: DialogTheme(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        home: HomeScreen());
  }
}

// class MyHome extends StatelessWidget {
//   const MyHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Students Attandance'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Lottie.asset('assets/raw/office.json'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => GetlocationScreen()));
//               },
//               child: Text('Get Location'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
