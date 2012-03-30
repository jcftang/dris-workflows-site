The software needed to run DRIS Workflows

* nodejs
  * npm
    * node-dri
    * node-fedora
* mongodb
* fedora-commons

The application and the sub-modules have tests (written with expresso) and can be tested on a *NIX like system. The testing procedure currently fails on the Windows platform due to issues with expresso (node-jscoverage) not correctly installing. There are distant plans for migrating the tests to mocha.
