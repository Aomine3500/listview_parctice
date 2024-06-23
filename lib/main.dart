import 'package:flutter/material.dart';

class Friends {
  final String firstName;
  final String lastName;
  final String occupation;

  Friends(
      {required this.firstName,
      required this.lastName,
      required this.occupation});
}

List<Friends> friends = [
  Friends(firstName: "Ahmed", lastName: "Znouda", occupation: "Developer"),
  Friends(firstName: "Zayneb", lastName: "Ali", occupation: "Lawyer"),
  Friends(firstName: "Hédi", lastName: "Ben Sassi", occupation: "Professor"),
  Friends(firstName: "Karima", lastName: "Sahli", occupation: "Dentist"),
  Friends(firstName: "Rami", lastName: "Aziz", occupation: "Football Player")
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter ListView Practice',
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
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Practice ListView",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent),
              ),
            ),
            body: Center(
              child: ListView.separated(
                itemCount: friends.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://picsum.photos/250?image=225")),
                            title: Text(friends[index].firstName),
                            subtitle: Text(friends[index].lastName),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(friends[index].occupation),
                          ),
                        ]),
                  );
                },
                separatorBuilder: (BuildContext context, index) => (Container(
                  color: Colors.amber[600],
                  height: 50,
                  child: const Text(
                    "**************************",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )),
              ),
            )));
  }
}
