import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Generate localized Farsi lorem text
    final fakerFa = Faker(provider: FakerDataProviderFa());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faker'),
      ),
      body: Center(
        child: ListView(
          children: [
            Text(faker.address.country()),
            Text(faker.company.name()),
            Text(faker.currency.code()),
            Text(faker.internet.ipv4Address()),
            Text(faker.job.title()),
            Text(faker.person.firstName()),
            Text(faker.sport.name()),

            // Generate a random amount of IP v4 addresses (max 10).
            Text('${random.amount((_) => faker.internet.ipv4Address(), 10)}'),

            // Generate random boolean.
            Text('${random.boolean()}'),

            // Generate random decimal.
            Text('${random.decimal()}'),

            // Generate random DateTime, between the years 2000 and 2020
            Text('${faker.date.dateTime(minYear: 2000, maxYear: 2020)}'),

            // Generate random User Agent, with osName iOS
            Text(faker.internet.userAgent(osName: 'iOS')),

            Text(fakerFa.lorem.word()),
            Text(fakerFa.lorem.sentence()),
            Text(fakerFa.lorem.words(10).join(' ')),
            Text(fakerFa.lorem.sentences(3).join(' ')),

            // Generate JWT(json web token)
            Text(faker.jwt.valid()),
            Text(faker.jwt
                .valid(expiresIn: DateTime.now().add(Duration(hours: 2)))),
            Text(faker.jwt.expired()),
            Text(faker.jwt
                .custom(expiresIn: DateTime.now(), payload: {'key': 'value'})),
          ],
        ),
      ),
    );
  }
}
