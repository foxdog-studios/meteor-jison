Jison.Parsers = {
  _register: function(name, parser) {
    if (name in Jison.Parsers) {
      throw new Error('A Jison parser named ' + name + ' already exists.');
    }
    Jison.Parsers[name] = parser;
  }
};

