# TemplateParser [![pub package](https://img.shields.io/pub/v/template_parser.svg)](https://pub.dartlang.org/packages/template_parser)

A flutter package to parse String template.


## Installation

You just need to add `template_parser` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

```yaml
dependencies:
  template_parser: ^0.0.2
```

## Example

A simple usage example:
```dart
import 'package:template_parser/template_parser.dart';

main() {
   final template = 'My name is {{FullName}}. I am {{ Age }}, have worked as a '
      '{{designation}} for a bigger company, in an agile team, working mostly '
      'on {{Skills}} platform.';

  final List<TemplateModel> models = [
    TemplateModel(variable: 'FullName', value: 'Sodipto Saha'),
    TemplateModel(variable: 'Age', value: '26'),
    TemplateModel(variable: 'designation', value: 'Senior Software Engineer'),
    TemplateModel(variable: 'Skills', value: 'Flutter,C# And .NET Core'),
  ];
  
  final parseTemplate=TemplateParser.parse(template, models);
  print(parseTemplate);
}
```

## TemplateModel

Name  | Description| Example
------------ | ------------|----------
variable | variable of the template | {{FullName}}
value |  Value of the template variable | Sodipto Saha

## Warning 

>Note: `{{}}` is required for template rendering.
</br>
{{}} ❌
</br>
{Variable} ❌
</br>
{Variable ❌
</br>
{Variable}} ❌
</br>
{{Variable} ❌
</br>
{{Variable}} ✔️
</br>
{{ Variable }} ✔️
</br>
{{variable }} ✔️
</br>
{{ variable}} ✔️
</br>
{{ variable variable }} ✔️


## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/sodipto/flutter-template-parser/issues
