Package.describe({
  name: 'fds:jison-build',
  summary: "[DON'T USE] Bison for Javascript (build)",
  version: '0.0.0',
  git: 'https://github.com/foxdog-studios/meteor-jison.git'
});

Package.registerBuildPlugin({
  name: 'jison',
  use: ['underscore'],
  sources: ['plugin/compile_jison.js'],
  npmDependencies: { jison: '0.4.15' }
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.2.1');
  api.use('fds:jison-base@0.0.0');
  api.imply('fds:jison-base');
  api.addFiles('main.js');
  api.export('Jison');
});

