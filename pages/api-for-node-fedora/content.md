# TOC
   - [Test cases for the node-fedora package](#test-cases-for-the-node-fedora-package)
     - [createFedoraObject, will create a FedoraObject](#test-cases-for-the-node-fedora-package-createfedoraobject-will-create-a-fedoraobject)
     - [getFedoraList, Get a list of FedoraObjects](#test-cases-for-the-node-fedora-package-getfedoralist-get-a-list-of-fedoraobjects)
     - [getFedoraObject, get a fedoraObject](#test-cases-for-the-node-fedora-package-getfedoraobject-get-a-fedoraobject)
     - [deleteObject, will delete an object from fedora](#test-cases-for-the-node-fedora-package-deleteobject-will-delete-an-object-from-fedora)
     - [getNextPID, will get the next PID that is available from fedora](#test-cases-for-the-node-fedora-package-getnextpid-will-get-the-next-pid-that-is-available-from-fedora)
<a name="" />
 
<a name="test-cases-for-the-node-fedora-package" />
# Test cases for the node-fedora package
<a name="test-cases-for-the-node-fedora-package-createfedoraobject-will-create-a-fedoraobject" />
## createFedoraObject, will create a FedoraObject
should create a FedoraObject.

```js
			fedora.createFedoraObject(testNamespace,testLabel, function(result){
				testResult = result;
				result.should.exist;
				result.should.include(testNamespace + ":");
				done();
			});
```

<a name="test-cases-for-the-node-fedora-package-getfedoralist-get-a-list-of-fedoraobjects" />
## getFedoraList, Get a list of FedoraObjects
should return a list of FedoraObjects from the fedora repository.

```js
			fedora.getFedoraList("*",function(resultData){
				resultData.should.exist;
				resultData.should.include('result');
				resultData.should.not.be.empty;
			}, 
			function(error){
				should.not.exist(error);
			});
```

<a name="test-cases-for-the-node-fedora-package-getfedoraobject-get-a-fedoraobject" />
## getFedoraObject, get a fedoraObject
should return a fedoraObject.

```js
			fedora.getFedoraObject(testResult, function(resultData){
				resultData.should.include(testResult);
				done();
			});
```

<a name="test-cases-for-the-node-fedora-package-deleteobject-will-delete-an-object-from-fedora" />
## deleteObject, will delete an object from fedora
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

<a name="test-cases-for-the-node-fedora-package-getnextpid-will-get-the-next-pid-that-is-available-from-fedora" />
## getNextPID, will get the next PID that is available from fedora
should return the next PID from fedora.

```js
			fedora.getNextPID("node", function(resultData){
				resultData.should.include("node:");
				done();
			});
```

