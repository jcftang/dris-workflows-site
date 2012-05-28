make[2]: Entering directory `/data/home/jtang/develop/dris-workflows-site/build/node-fedora'
info: Fedora package configured
# TOC
   - [Test cases for the node-fedora package](#test-cases-for-the-node-fedora-package)
     - [Calling createFedoraObject(), will create a fedoraObject](#test-cases-for-the-node-fedora-package-calling-createfedoraobject-will-create-a-fedoraobject)
     - [Calling getFedoraList(), Get a list of fedoraObjects](#test-cases-for-the-node-fedora-package-calling-getfedoralist-get-a-list-of-fedoraobjects)
     - [Calling getFedoraObject(), get a fedoraObject](#test-cases-for-the-node-fedora-package-calling-getfedoraobject-get-a-fedoraobject)
     - [Calling addXMLDatastream(), to add a Datastream to an existing fedoraObject](#test-cases-for-the-node-fedora-package-calling-addxmldatastream-to-add-a-datastream-to-an-existing-fedoraobject)
     - [Calling modifyXMLDatastream(), to add a Datastream to an existing fedoraObject](#test-cases-for-the-node-fedora-package-calling-modifyxmldatastream-to-add-a-datastream-to-an-existing-fedoraobject)
     - [Calling addMediaDatastream(), to add a Datastream to an existing fedoraObject](#test-cases-for-the-node-fedora-package-calling-addmediadatastream-to-add-a-datastream-to-an-existing-fedoraobject)
     - [Calling modifyMediaDatastream(), to add a Datastream to an existing fedoraObject](#test-cases-for-the-node-fedora-package-calling-modifymediadatastream-to-add-a-datastream-to-an-existing-fedoraobject)
     - [Calling deleteObject(), will delete an object from fedora](#test-cases-for-the-node-fedora-package-calling-deleteobject-will-delete-an-object-from-fedora)
     - [Calling getNextPID(), will get the next PID that is available from fedora](#test-cases-for-the-node-fedora-package-calling-getnextpid-will-get-the-next-pid-that-is-available-from-fedora)
<a name="" />
 
<a name="test-cases-for-the-node-fedora-package" />
# Test cases for the node-fedora package
<a name="test-cases-for-the-node-fedora-package-calling-createfedoraobject-will-create-a-fedoraobject" />
## Calling createFedoraObject(), will create a fedoraObject
should create a fedoraObject.

```js
			fedora.createFedoraObject(testNamespace, testLabel, function(result) {
				testResult = result;
				result.should.exist
				result.should.include(testNamespace + ":");
				done();
			});
```

<a name="test-cases-for-the-node-fedora-package-calling-getfedoralist-get-a-list-of-fedoraobjects" />
## Calling getFedoraList(), Get a list of fedoraObjects
should return a list of fedoraObjects from the fedora repository.

```js
			fedora.getFedoraList("*", function(resultData) {
				resultData.should.exist
				resultData.should.include('result');
				resultData.should.not.be.empty
			}, function(error) {
				should.not.exist(error);
			});
```

<a name="test-cases-for-the-node-fedora-package-calling-getfedoraobject-get-a-fedoraobject" />
## Calling getFedoraObject(), get a fedoraObject
should return a fedoraObject.

```js
			fedora.getFedoraObject(testResult, function(resultData) {
				resultData.should.include(testResult);
				done();
			});
```

<a name="test-cases-for-the-node-fedora-package-calling-addxmldatastream-to-add-a-datastream-to-an-existing-fedoraobject" />
## Calling addXMLDatastream(), to add a Datastream to an existing fedoraObject
should return the datastream.

```js
			var data = '<oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd"><dc:title>jhdgj</dc:title><dc:identifier>4f8ffc8ff889d6ab44000001</dc:identifier></oai_dc:dc>'
	
			fedora.addXMLDatastream(testResult, "DC", data, function(resultData) {
				resultData.should.include(testResult);
				done();
			}, function(err) {
				console.log(err);
			});
```

<a name="test-cases-for-the-node-fedora-package-calling-modifyxmldatastream-to-add-a-datastream-to-an-existing-fedoraobject" />
## Calling modifyXMLDatastream(), to add a Datastream to an existing fedoraObject
should return the datastream.

```js
			var data = '<oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd"><dc:title>jhdgj - updated!</dc:title><dc:identifier>4f8ffc8ff889d6ab44000001</dc:identifier></oai_dc:dc>'
			fedora.modifyXMLDatastream(testResult, "DC", data, function(resultData) {
				resultData.should.include(testResult);
				done();
			}, function(err) {
				console.log(err);
			});
```

<a name="test-cases-for-the-node-fedora-package-calling-addmediadatastream-to-add-a-datastream-to-an-existing-fedoraobject" />
## Calling addMediaDatastream(), to add a Datastream to an existing fedoraObject
should return the datastream.

```js
			var data = {
				fileLocation: 'd9375fdf1fa331bbe0b4aa79f766972f0d408a29/Eagle_Fall_Sunrise.jpg'
			}
			fedora.addMediaDatastream(testResult, "IMAGE", data, function(resultData) {
				resultData.should.include(testResult);
				done();
			}, function(err) {
				console.log(err);
			});
```

<a name="test-cases-for-the-node-fedora-package-calling-modifymediadatastream-to-add-a-datastream-to-an-existing-fedoraobject" />
## Calling modifyMediaDatastream(), to add a Datastream to an existing fedoraObject
should return the datastream.

```js
			var data = {
				fileLocation: 'd9375fdf1fa331bbe0b4aa79f766972f0d408a29/Eagle_Fall_Sunrise.jpg'
			}
			fedora.modifyMediaDatastream(testResult, "IMAGE", data, function(resultData) {
				resultData.should.include(testResult);
				done();
			}, function(err) {
				console.log(err);
			});
```

<a name="test-cases-for-the-node-fedora-package-calling-deleteobject-will-delete-an-object-from-fedora" />
## Calling deleteObject(), will delete an object from fedora
should delete the requested object from fedora.

```js
			fedora.deleteObject(testResult, function(resultData) {
				var myregexp = new RegExp("[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.?[0-9]*Z");
				resultData.should.match(myregexp);
				done();
			}, function(error) {
				should.not.exist(error);
			});
```

<a name="test-cases-for-the-node-fedora-package-calling-getnextpid-will-get-the-next-pid-that-is-available-from-fedora" />
## Calling getNextPID(), will get the next PID that is available from fedora
should return the next PID from fedora.

```js
			fedora.getNextPID("node", function(resultData) {
				resultData.should.include("node:");
				done();
			});
```

make[2]: Leaving directory `/data/home/jtang/develop/dris-workflows-site/build/node-fedora'
