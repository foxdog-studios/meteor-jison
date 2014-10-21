Package.describe({
  name: 'fds:jison-base',
  summary: "[DON'T USE] Bison for JavaScript (base)",
  version: '0.0.0',
  git: 'https://github.com/foxdog-studios/meteor-jison.git'
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@0.9.4');
  api.addFiles('fds:jison-base.js');
  api.export('Jison');
});

