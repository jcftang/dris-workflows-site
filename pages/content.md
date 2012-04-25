The DRIS Workflows package is a prototype system developed by some interns at TCHPC during the 2012 internship.

## Primary authors of DRIS Workflows

* <Matthias.Van.Wambeke@howest.be>
* <Quirijn.Groot.Bluemink@howest.be>

With input from the TCHPC and DRIS team at TCD.

## Architecture

The DRIS Workflows application consists of a number of components,
there are some planned features which have yet to be implemented.

* dri-api (REST API server)
  * node-dri (Back-office operations)
    * node-fedora (Fedora-commons interface, planned on turning this
    into a plugin)
* dri-auth (oauth2 provider, planned)

### Overview of current Architecture

![](/img/HighLevelArch-mvanwamb-qgrootbl-jtang-2012-04-13-dris-workflows.png)

The architecture of the system is in an unstable state as we test the
design of the object model.

## Licensing

TBD - ultimately GPLv2 or MIT based license?

## Requirements

The pre-requisites for installing the DRIS Workflows package.

* Nodejs 0.6.x - <http://www.nodejs.org> - developed with
* Mongodb 2.0.x - <http://www.mongodb.org> - developed with
* fedora-commons 3.5 - <http://fedora-commons.org/> - tested against REST api

The systems that we have tested on

* Tested on OSX 10.6.x, 10.7.x, SL6.x, Windows 7
* Browsers tested with Chrome

## Installation

Currently the DRIS Workflows web-application depends on some internal
servers in TCHPC, this is required to pull the latest development versions
of dri-api, node-fedora, node-dri.

If you are on a VPN to TCHPC or TCD it is possible to do the following to
install the API server and the Web application.

### Deployment of API server (Required)

	git clone ssh://git@howest-server.tchpc.tcd.ie/howest/node/dri-api.git
	cd dri-api
	npm install

Once the _dri-api_ server is installed with its dependancies, it must
be started by doing the following.

	node app.js

The fedora configuration needs to be refactored in the future, to
configure the target fedora repository the administrator needs to edit
_node_modules/fedora/lib/fedora.js_.

### Deployment of DRIS Workflows (Required)

	git clone ssh://git@howest-server.tchpc.tcd.ie/howest/node/dris-workflows.git
	cd dris-workflows
	npm install

Once the _dris-workflow_ application is installed with its dependancies, it must
be started by doing the following.

	node app.js

## Testing

The intent is to release a set of API tests which can be used as a basis
for DRIS (DRI) compliance testing for those who wish to implement or
re-implement a compatible system.

The tests are written with the [mocha](http://visionmedia.github.com/mocha/) test framework.
The DRIS Workflows and dependent packages have tests which can be run as follows

### Linux and OSX

	cd PACKAGE
	make test

### Windows

	cd PACKAGE
	NODE_PATH=./lib NODE_ENV=test ./node_modules/.bin/mocha \
	--reporter spec \
	test/*.js

## mrconfig

If you are using [mr](http://joey.kitenet.net/code/mr/), the following
config file can be used to checkout all the relavent packages.

	[dri-api]
	checkout = git clone 'ssh://git@lonsdale.tchpc.tcd.ie/navr/node/dri-api' 'dri-api'

	[dris-workflows]
	checkout = git clone 'ssh://git@lonsdale.tchpc.tcd.ie/navr/node/dris-workflows' 'dris-workflows'

	[dris-workflows-site]
	checkout = git clone 'ssh://git@lonsdale.tchpc.tcd.ie/navr/node/dris-workflows-site' 'dris-workflows-site'

	[node-dri]
	checkout = git clone 'ssh://git@lonsdale.tchpc.tcd.ie/navr/node/node-dri' 'node-dri'

	[node-fedora]
	checkout = git clone 'ssh://git@lonsdale.tchpc.tcd.ie/navr/node/node-fedora' 'node-fedora'
