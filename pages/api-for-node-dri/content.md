# TOC
   - [Test cases for node-dri package](#test-cases-for-node-dri-package)
     - [Get object types](#test-cases-for-node-dri-package-get-object-types)
     - [Creating a Dri-Collection](#test-cases-for-node-dri-package-creating-a-dri-collection)
     - [Creating a Series](#test-cases-for-node-dri-package-creating-a-series)
     - [Creating an Item](#test-cases-for-node-dri-package-creating-an-item)
     - [Getting an Item](#test-cases-for-node-dri-package-getting-an-item)
     - [Getting a Series](#test-cases-for-node-dri-package-getting-a-series)
     - [Getting a Series children](#test-cases-for-node-dri-package-getting-a-series-children)
     - [Getting a Dri-Collection](#test-cases-for-node-dri-package-getting-a-dri-collection)
     - [Pushing the item into fedora](#test-cases-for-node-dri-package-pushing-the-item-into-fedora)
     - [Removing the item ](#test-cases-for-node-dri-package-removing-the-item-)
     - [Removing the series ](#test-cases-for-node-dri-package-removing-the-series-)
     - [Removing the dri-collection ](#test-cases-for-node-dri-package-removing-the-dri-collection-)
<a name="" />
 
<a name="test-cases-for-node-dri-package" />
# Test cases for node-dri package
<a name="test-cases-for-node-dri-package-get-object-types" />
## Get object types
should return an array of all the object types.

```js
			dri.getObjectTypes(function(result) {
				result.should.be.ok
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-creating-a-dri-collection" />
## Creating a Dri-Collection
should create a Dri-Collection and return the id of the Dri-Collection.

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

<a name="test-cases-for-node-dri-package-creating-a-series" />
## Creating a Series
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

<a name="test-cases-for-node-dri-package-creating-an-item" />
## Creating an Item
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

<a name="test-cases-for-node-dri-package-getting-an-item" />
## Getting an Item
should get an Item and return the Item.

```js
			dri.getObject(itemId, function(result) {
				assert.include(result._id,itemId)
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-getting-a-series" />
## Getting a Series
should get an Series and return the Series.

```js
			dri.getObject(seriesId, function(result) {
				assert.equal(seriesId, result._id);
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-getting-a-series-children" />
## Getting a Series children
should get an Series and return the children.

```js
			dri.getChildren(seriesId, function(result) {
				assert.include(result[0],itemId);
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-getting-a-dri-collection" />
## Getting a Dri-Collection
should get an Dri-Collection and return the Dri-Collection.

```js
			dri.getObject(collId, function(result) {
				assert.equal(collId, result._id);
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-pushing-the-item-into-fedora" />
## Pushing the item into fedora
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

<a name="test-cases-for-node-dri-package-removing-the-item-" />
## Removing the item 
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

<a name="test-cases-for-node-dri-package-removing-the-series-" />
## Removing the series 
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

<a name="test-cases-for-node-dri-package-removing-the-dri-collection-" />
## Removing the dri-collection 
should remove the dri-collection from MongoDB.

```js
			dri.removeObject(collId, function(result) {
				assert.include(result,collId)
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

