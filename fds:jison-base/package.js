Package.describe({
  name: 'fds:jison-base',
  summary: "[DON'T USE] Bison for JavaScript (base)",
  version: '0.0.0',
  git: 'https://github.com/foxdog-studios/meteor-jison.git'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.2.1');
  api.addFiles('fds:jison-base.js');
  api.export('Jison');
});

