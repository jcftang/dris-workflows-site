make[2]: Entering directory `/data/home/jtang/develop/dris-workflows-site/build/node-fedora'
# TOC
   - [Test cases for the node-fedora package](#test-cases-for-the-node-fedora-package)
     - [Calling createFedoraObject(), will create a fedoraObject](#test-cases-for-the-node-fedora-package-calling-createfedoraobject-will-create-a-fedoraobject)
     - [Calling getFedoraList(), Get a list of fedoraObjects](#test-cases-for-the-node-fedora-package-calling-getfedoralist-get-a-list-of-fedoraobjects)
     - [Calling getFedoraObject(), get a fedoraObject](#test-cases-for-the-node-fedora-package-calling-getfedoraobject-get-a-fedoraobject)
     - [Calling deleteObject(), will delete an object from fedora](#test-cases-for-the-node-fedora-package-calling-deleteobject-will-delete-an-object-from-fedora)
     - [Calling getNextPID(), will get the next PID that is available from fedora](#test-cases-for-the-node-fedora-package-calling-getnextpid-will-get-the-next-pid-that-is-available-from-fedora)
<a name="" />
 
<a name="test-cases-for-the-node-fedora-package" />
# Test cases for the node-fedora package
<a name="test-cases-for-the-node-fedora-package-calling-createfedoraobject-will-create-a-fedoraobject" />
## Calling createFedoraObject(), will create a fedoraObject
should create a fedoraObject.

```js
			fedora.createFedoraObject(testNamespace, testLabel, function(result){
				testResult = result;
				result.should.exist;
				result.should.include(testNamespace + ":");
				done();
			});
```

<a name="test-cases-for-the-node-fedora-package-calling-getfedoralist-get-a-list-of-fedoraobjects" />
## Calling getFedoraList(), Get a list of fedoraObjects
should return a list of fedoraObjects from the fedora repository.

```js
			fedora.getFedoraList("*", function(resultData){
				resultData.should.exist;
				resultData.should.include('result');
				resultData.should.not.be.empty;
			}, 
			function(error){
				should.not.exist(error);
			});
```

<a name="test-cases-for-the-node-fedora-package-calling-getfedoraobject-get-a-fedoraobject" />
## Calling getFedoraObject(), get a fedoraObject
should return a fedoraObject.

```js
			fedora.getFedoraObject(testResult, function(resultData){
				resultData.should.include(testResult);
				done();
			});
```

<a name="test-cases-for-the-node-fedora-package-calling-deleteobject-will-delete-an-object-from-fedora" />
## Calling deleteObject(), will delete an object from fedora
should delete the requested object from fedora.

```js
			fedora.deleteObject(testResult, function(resultData){
				var myregexp = new RegExp("[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.?[0-9]*Z");
				resultData.should.match(myregexp);
				done();
			}, function(error){
				should.not.exist(error);
			});
```

<a name="test-cases-for-the-node-fedora-package-calling-getnextpid-will-get-the-next-pid-that-is-available-from-fedora" />
## Calling getNextPID(), will get the next PID that is available from fedora
should return the next PID from fedora.

```js
			fedora.getNextPID("node", function(resultData){
				resultData.should.include("node:");
				done();
			});
```

make[2]: Leaving directory `/data/home/jtang/develop/dris-workflows-site/build/node-fedora'
