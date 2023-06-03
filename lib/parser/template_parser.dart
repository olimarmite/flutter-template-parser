import 'package:template_parser/template_parser.dart';

class TemplateParser {
  static String parse(
    String template,
    List<TemplateModel> models,
  ) {
    ///Return empty if provided template is empty.
    if (template.isEmpty) {
      return '';
    }

    ///Return provided temlate if models is empty.
    if (models.isEmpty) {
      return template;
    }

    /// Checked variables in any whitespaces by regex.
    final variableList = regExp.allMatches(template).toList();

    /// Removed whitespaces here.
    if (variableList.isNotEmpty) {
      for (final variable in variableList) {
        var key = variable[1].toString();
        template = template.replaceAll(key, replaceCacheValue);
        key = key.replaceAll('{{', '').replaceAll('}}', '');
        key = '{{${key.trim()}}}';
        template = template.replaceAll(replaceCacheValue, key);
      }
    }

    /// Replaces variable with value.
    for (final model in models) {
      if (model.variable.trim().isNotEmpty) {
        final key = '{{${model.variable.trim()}}}';
        template = template.replaceAll(key, model.value);
      }
    }

    ///Return parse template
    return template;
  }
}
