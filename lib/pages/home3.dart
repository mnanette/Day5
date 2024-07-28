
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyJsonApp extends StatefulWidget {
  @override
  _MyJsonAppState createState() => _MyJsonAppState();
}

class _MyJsonAppState extends State<MyJsonApp> {
  final ValueNotifier<List<Person>> _personsNotifier = ValueNotifier([]);

Future<List<Person>> loadPersons() async {
  final jsonString = await rootBundle.loadString('assets/data.json');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => Person.fromJson(json)).toList();
}

  @override
  void initState() {
    super.initState();
    loadPersons().then((persons) {
      _personsNotifier.value = persons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON Data Example')),
      body: ValueListenableBuilder<List<Person>>(
        valueListenable: _personsNotifier,
        builder: (context, persons, _) {
          return ListView.builder(
            itemCount: persons.length,
            itemBuilder: (context, index) {
              final person = persons[index];
              return ListTile(
                title: Text(person.name),
                subtitle: Text('Age: ${person.age}'),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _personsNotifier.dispose();
    super.dispose();
  }
}
class Person {
  final int id;
  final String name;
  final int age;

  Person({required this.id, required this.name, required this.age});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'],
      age: json['age'],
    );
  }
}
