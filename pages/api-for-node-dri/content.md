# TOC
   - [Test cases for node-dri package](#test-cases-for-node-dri-package)
     - [Calling getObjectTypes(), will get object types](#test-cases-for-node-dri-package-calling-getobjecttypes-will-get-object-types)
     - [Calling createObject() to create a collection](#test-cases-for-node-dri-package-calling-createobject-to-create-a-collection)
     - [Calling createObject() to create a series](#test-cases-for-node-dri-package-calling-createobject-to-create-a-series)
     - [Calling createObject() to create an item](#test-cases-for-node-dri-package-calling-createobject-to-create-an-item)
     - [Calling getObject() to get an item](#test-cases-for-node-dri-package-calling-getobject-to-get-an-item)
     - [Calling getObject() to get a Series](#test-cases-for-node-dri-package-calling-getobject-to-get-a-series)
     - [Calling getChildren() to get the children of a series](#test-cases-for-node-dri-package-calling-getchildren-to-get-the-children-of-a-series)
     - [Calling getObject() to get a collection](#test-cases-for-node-dri-package-calling-getobject-to-get-a-collection)
     - [Calling approveItem() with a item id](#test-cases-for-node-dri-package-calling-approveitem-with-a-item-id)
     - [Calling removeObject() with a item id](#test-cases-for-node-dri-package-calling-removeobject-with-a-item-id)
     - [calling removeObject() with a series id](#test-cases-for-node-dri-package-calling-removeobject-with-a-series-id)
     - [Calling removeObject() with a collection id](#test-cases-for-node-dri-package-calling-removeobject-with-a-collection-id)
<a name="" />
 
<a name="test-cases-for-node-dri-package" />
# Test cases for node-dri package
<a name="test-cases-for-node-dri-package-calling-getobjecttypes-will-get-object-types" />
## Calling getObjectTypes(), will get object types
should return an array of all the object types.

```js
			dri.getObjectTypes(function(result) {
				result.should.be.ok
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-createobject-to-create-a-collection" />
## Calling createObject() to create a collection
should create a collection and return the id of the collection.

```js
			var data = {
				properties : {
					title : "AutoTestColl" + rnd,
					subtitle : "AutoTestColl" + rnd
				},
				status : "Open",
				type:"collection"
			};
			dri.createObject(data, function(result) {
				result.should.be.ok
				assert.length(result,24)
				collId = result;
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-createobject-to-create-a-series" />
## Calling createObject() to create a series
should create a series and return the id of the series.

```js
			var data = {
				properties : {
					title : "AutoTestSeries" + rnd,
					subtitle : "AutoTestSeries" + rnd
				},
				status : "Open",
				type:"series",
				parentId: collId
			};
			dri.createObject(data, function(result) {
				result.should.be.ok
				assert.length(result,24)
				seriesId = result;
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-createobject-to-create-an-item" />
## Calling createObject() to create an item
should create an Item and return the id of the Item.

```js
			var data = {
				properties : {
					title : "AutoTestItem" + rnd,
					subtitle : "AutoTestItem" + rnd
				},
				status : "Open",
				type:"item",
				parentId: seriesId
			};
			dri.createObject(data, function(result) {
				result.should.be.ok
				assert.length(result,24)
				itemId = result;
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-getobject-to-get-an-item" />
## Calling getObject() to get an item
should get an Item and return the Item.

```js
			dri.getObject(itemId, function(result) {
				assert.include(result._id,itemId)
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-getobject-to-get-a-series" />
## Calling getObject() to get a Series
should get an series and return the series.

```js
			dri.getObject(seriesId, function(result) {
				assert.equal(seriesId, result._id);
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-getchildren-to-get-the-children-of-a-series" />
## Calling getChildren() to get the children of a series
should get the series and return the children.

```js
			dri.getChildren(seriesId, function(result) {
				assert.include(result[0],itemId);
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-getobject-to-get-a-collection" />
## Calling getObject() to get a collection
should get a collection and return the collection.

```js
			dri.getObject(collId, function(result) {
				assert.equal(collId, result._id);
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-approveitem-with-a-item-id" />
## Calling approveItem() with a item id
should push the item into fedora and return the fedora id from that item.

```js
			dri.approveItem(itemId, "cfedoraLib", function(pid) {
				pid.should.include(":");
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

<a name="test-cases-for-node-dri-package-calling-removeobject-with-a-item-id" />
## Calling removeObject() with a item id
should remove the item from MongoDB.

```js
			dri.removeObject(itemId, function(result) {
				assert.include(result,itemId)
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

<a name="test-cases-for-node-dri-package-calling-removeobject-with-a-series-id" />
## calling removeObject() with a series id
should remove the series from MongoDB.

```js
			dri.removeObject(seriesId, function(result) {
				assert.include(result,seriesId)
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

<a name="test-cases-for-node-dri-package-calling-removeobject-with-a-collection-id" />
## Calling removeObject() with a collection id
should remove the collection from MongoDB.

```js
			dri.removeObject(collId, function(result) {
				assert.include(result,collId)
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

