'use strict';

var jison = Npm.require('jison');
var path  = Npm.require('path');

var handleJison = function(compileStep) {
  var grammar = compileStep.read().toString('utf8');
  var generator = jison.Generator(grammar);
  var parser = generator.generate({moduleType: 'js'});

  var name = path.basename(compileStep.inputPath, '.jison');
  var registerParser = registerParserTemplate({name: name});

  var data = [parser, registerParser].join('');

  compileStep.addJavaScript({
    path: compileStep.inputPath + '.js',
    sourcePath: compileStep.inputPath,
    data: data
  });
};

var registerParserTemplate = _.template(
  "\nJison.Parsers._register('<%= name %>', parser);\n"
);

Plugin.registerSourceHandler('jison', handleJison);

