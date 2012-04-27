# TOC
   - [Test cases for node-dri package](#test-cases-for-node-dri-package)
     - [Calling getObjectTypes(onSuccess, onError), will get object types](#test-cases-for-node-dri-package-calling-getobjecttypesonsuccess-onerror-will-get-object-types)
     - [Calling createObject(data, onSuccess, onError) to create a collection](#test-cases-for-node-dri-package-calling-createobjectdata-onsuccess-onerror-to-create-a-collection)
     - [Calling createObject(data, onSuccess, onError) to create a series](#test-cases-for-node-dri-package-calling-createobjectdata-onsuccess-onerror-to-create-a-series)
     - [Calling createObject(data, onSuccess, onError) to create an item](#test-cases-for-node-dri-package-calling-createobjectdata-onsuccess-onerror-to-create-an-item)
     - [Calling getObject(id, onSuccess, onError) to get an item](#test-cases-for-node-dri-package-calling-getobjectid-onsuccess-onerror-to-get-an-item)
     - [Calling getObject(id, onSuccess, onError) to get a Series](#test-cases-for-node-dri-package-calling-getobjectid-onsuccess-onerror-to-get-a-series)
     - [Calling getChildren(parentId, onSuccess, onError) to get the children of a series](#test-cases-for-node-dri-package-calling-getchildrenparentid-onsuccess-onerror-to-get-the-children-of-a-series)
     - [Calling getObject(id, onSuccess, onError) to get a collection](#test-cases-for-node-dri-package-calling-getobjectid-onsuccess-onerror-to-get-a-collection)
     - [Calling approveItem(id, fedoraNamespace, onSuccess, onError) with a item id](#test-cases-for-node-dri-package-calling-approveitemid-fedoranamespace-onsuccess-onerror-with-a-item-id)
     - [Calling removeObject(id, onSuccess, onError) with a item id](#test-cases-for-node-dri-package-calling-removeobjectid-onsuccess-onerror-with-a-item-id)
     - [Calling removeObject(id, onSuccess, onError) with a series id](#test-cases-for-node-dri-package-calling-removeobjectid-onsuccess-onerror-with-a-series-id)
     - [Calling removeObject(id, onSuccess, onError) with a collection id](#test-cases-for-node-dri-package-calling-removeobjectid-onsuccess-onerror-with-a-collection-id)
<a name="" />
 
<a name="test-cases-for-node-dri-package" />
# Test cases for node-dri package
<a name="test-cases-for-node-dri-package-calling-getobjecttypesonsuccess-onerror-will-get-object-types" />
## Calling getObjectTypes(onSuccess, onError), will get object types
should return an array of all the object types.

```js
			dri.getObjectTypes(function(result) {
				result.should.be.ok
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-createobjectdata-onsuccess-onerror-to-create-a-collection" />
## Calling createObject(data, onSuccess, onError) to create a collection
should create a collection and return the id of the collection.

```js
			var data = {
				properties : {
					title : "AutoTestColl" + rnd,
					subtitle : "SubAutoTestColl" + rnd
				},
				status : "open",
				type : "collection"
			};
			dri.createObject(data, function(result) {
				result.should.be.ok
				assert.length(result, 24)
				collId = result;
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-createobjectdata-onsuccess-onerror-to-create-a-series" />
## Calling createObject(data, onSuccess, onError) to create a series
should create a series and return the id of the series.

```js
			var data = {
				properties : {
					title : "AutoTestSeries" + rnd,
					subtitle : "SubAutoTestSeries" + rnd
				},
				status : "open",
				type : "series",
				parentId : collId
			};
			dri.createObject(data, function(result) {
				result.should.be.ok
				assert.length(result, 24)
				seriesId = result;
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-createobjectdata-onsuccess-onerror-to-create-an-item" />
## Calling createObject(data, onSuccess, onError) to create an item
should create an Item and return the id of the Item.

```js
			var data = {
				properties : {
					title : "AutoTestItem" + rnd,
					subtitle : "SubAutoTestItem" + rnd
				},
				status : "open",
				type : "item",
				parentId : seriesId
			};
			dri.createObject(data, function(result) {
				result.should.be.ok
				assert.length(result, 24)
				itemId = result;
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-getobjectid-onsuccess-onerror-to-get-an-item" />
## Calling getObject(id, onSuccess, onError) to get an item
should get an Item and return the Item.

```js
			dri.getObject(itemId, function(result) {
				assert.include(result._id, itemId)
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-getobjectid-onsuccess-onerror-to-get-a-series" />
## Calling getObject(id, onSuccess, onError) to get a Series
should get an series and return the series.

```js
			dri.getObject(seriesId, function(result) {
				assert.equal(seriesId, result._id);
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-getchildrenparentid-onsuccess-onerror-to-get-the-children-of-a-series" />
## Calling getChildren(parentId, onSuccess, onError) to get the children of a series
should get the series and return the children.

```js
			dri.getChildren(seriesId, function(result) {
				assert.include(result[0], itemId);
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-getobjectid-onsuccess-onerror-to-get-a-collection" />
## Calling getObject(id, onSuccess, onError) to get a collection
should get a collection and return the collection.

```js
			dri.getObject(collId, function(result) {
				assert.equal(collId, result._id);
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-approveitemid-fedoranamespace-onsuccess-onerror-with-a-item-id" />
## Calling approveItem(id, fedoraNamespace, onSuccess, onError) with a item id
should push the item into fedora and return the fedora id from that item.

```js
			dri.approveItem(itemId, "afedoraLib", function(pid) {
				pid.should.include(":");
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

<a name="test-cases-for-node-dri-package-calling-removeobjectid-onsuccess-onerror-with-a-item-id" />
## Calling removeObject(id, onSuccess, onError) with a item id
should remove the item from MongoDB.

```js
			dri.removeObject(itemId, function(result) {
				assert.include(result, itemId)
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

<a name="test-cases-for-node-dri-package-calling-removeobjectid-onsuccess-onerror-with-a-series-id" />
## Calling removeObject(id, onSuccess, onError) with a series id
should remove the series from MongoDB.

```js
			dri.removeObject(seriesId, function(result) {
				assert.include(result, seriesId)
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

<a name="test-cases-for-node-dri-package-calling-removeobjectid-onsuccess-onerror-with-a-collection-id" />
## Calling removeObject(id, onSuccess, onError) with a collection id
should remove the collection from MongoDB.

```js
			dri.removeObject(collId, function(result) {
				assert.include(result, collId)
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

