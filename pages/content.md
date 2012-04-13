The DRIS Workflows package is a prototype system developed by some interns at TCHPC during the 2012 internship.

## Primary authors of DRIS Workflows

* <Matthias.Van.Wambeke@howest.be>
* <Quirijn.Groot.Bluemink@howest.be>

With help from the TCHPC and DRIS team at TCD.

## Requirements

The pre-requisites for installing the DRIS Workflows package.

* Nodejs 0.6.x - <http://www.nodejs.org> - developed with
* Mongodb 2.0.x - <http://www.mongodb.org> - developed with

The systems that we have tested on

* Tested on OSX 10.6.x, 10.7.x, SL6.x, Windows 7
* Browsers tested with Chrome

## Installation

Currently the DRIS Workflows web-application depends on some internal
servers in TCHPC, this is required to pull the latest development versions
of dri-api, node-fedora, node-dri.

If you are on VPN to TCHPC or TCD it is possible to do the following to
install the API server and the Web application.

### Deployment of API server (Required)

	git clone ssh://git@howest-server.tchpc.tcd.ie/howest/node/dri-api.git
	cd dri-api
	npm install

Once the _dri-api_ server is installed with its dependancies, it must
be started by doing the following.

	node app.js

### Deployment of DRIS Workflows (Required)

	git clone ssh://git@howest-server.tchpc.tcd.ie/howest/node/dris-workflows.git
	cd dris-workflows
	npm install

Once the _dris-wor_ server is installed with its dependancies, it must
be started by doing the following.

	node app.js
