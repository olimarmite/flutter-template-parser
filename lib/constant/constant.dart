/// Template replace cache value
const String replaceCacheValue = '%==>var<==%';

/// Template variable whitespace validator
RegExp regExp =
    RegExp(r'(\{\{((\s+[a-zA-Z]*)|([a-zA-Z]*\s+)|(\s+[a-zA-Z]*\s+))?\}\})');
