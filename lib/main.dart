import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home3.dart';

void main() {
    List<String> example1 = ["fleeower", "fleeow", "fleeight"];
    List<String> example2 = ["dog", "dracecar", "dcar"];

  print(longestCommonPrefix(example1)); // Output: "fl"
  print(longestCommonPrefix(example2)); // Output: ""
 
 


  runApp(const MyApp());
}




String longestCommonPrefix(List<String> strs) {
  if (strs.isEmpty) {
    return ''; // Empty input, return an empty string
  }

  // Sort the strings lexicographically
  strs.sort();

  // Compare the first and last strings
  String first = strs.first;
  String last = strs.last;
  int minLength = first.length < last.length ? first.length : last.length;

  int commonLength = 0;
  for (int i = 0; i < minLength; i++) {
    if (first[i] == last[i]) {
      commonLength++;
    } else {
      break; // Stop when characters don't match
    }
  }

  return first.substring(0, commonLength);
}

 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyJsonApp() ,
    );
  }
}
 