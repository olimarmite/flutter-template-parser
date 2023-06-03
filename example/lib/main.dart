import 'package:flutter/material.dart';
import 'package:template_parser/template_parser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Template Parser',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: TemplateParserPage(),
    );
  }
}

class TemplateParserPage extends StatelessWidget {
  TemplateParserPage({Key? key}) : super(key: key);

  final template = 'My name is {{FullName}}. I am {{ Age }}, have worked as a '
      '{{designation}} for a bigger company, in an agile team, working mostly '
      'on {{Skills}} platform.';

  final List<TemplateModel> models = [
    TemplateModel(variable: 'FullName', value: 'Sodipto Saha'),
    TemplateModel(variable: 'Age', value: '26'),
    TemplateModel(variable: 'designation', value: 'Senior Software Engineer'),
    TemplateModel(variable: 'Skills', value: 'Flutter,C# And .NET Core'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template Parser'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '-------- Before Parse -------',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.red),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                template,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  '-------- After Parse -------',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.green),
                ),
              ),
              Text(
                TemplateParser.parse(template, models),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )),
    );
  }
}
