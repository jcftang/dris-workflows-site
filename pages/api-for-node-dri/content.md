make[2]: Entering directory `/data/home/jtang/develop/dris-workflows-site/build/node-dri'
info: MongoDB: mongodb://localhost/dri
info: DRI package configured
info: Fetched items
# TOC
   - [Test cases for node-dri package](#test-cases-for-node-dri-package)
     - [Calling getObjectTypes(onSuccess, onError), will get object types](#test-cases-for-node-dri-package-calling-getobjecttypesonsuccess-onerror-will-get-object-types)
     - [Calling createObject(data, onSuccess, onError) to create a collection](#test-cases-for-node-dri-package-calling-createobjectdata-onsuccess-onerror-to-create-a-collection)
     - [Calling createObject(data, onSuccess, onError) to create a series](#test-cases-for-node-dri-package-calling-createobjectdata-onsuccess-onerror-to-create-a-series)
     - [Calling createObject(data, onSuccess, onError) to create an item](#test-cases-for-node-dri-package-calling-createobjectdata-onsuccess-onerror-to-create-an-item)
     - [Calling getObject(id, onSuccess, onError) to get an item](#test-cases-for-node-dri-package-calling-getobjectid-onsuccess-onerror-to-get-an-item)
     - [Calling getObject(id, onSuccess, onError) to get an item and convert to Dublin Core](#test-cases-for-node-dri-package-calling-getobjectid-onsuccess-onerror-to-get-an-item-and-convert-to-dublin-core)
     - [Calling getObject(id, onSuccess, onError) to get an item and convert to MODS](#test-cases-for-node-dri-package-calling-getobjectid-onsuccess-onerror-to-get-an-item-and-convert-to-mods)
     - [Calling getObject(id, onSuccess, onError) to get a Series](#test-cases-for-node-dri-package-calling-getobjectid-onsuccess-onerror-to-get-a-series)
     - [Calling getChildren(parentId, onSuccess, onError) to get the children of a series](#test-cases-for-node-dri-package-calling-getchildrenparentid-onsuccess-onerror-to-get-the-children-of-a-series)
     - [Calling getObject(id, onSuccess, onError) to get a collection](#test-cases-for-node-dri-package-calling-getobjectid-onsuccess-onerror-to-get-a-collection)
     - [Calling approveItem(id, fedoraNamespace, onSuccess, onError) with a item id](#test-cases-for-node-dri-package-calling-approveitemid-fedoranamespace-onsuccess-onerror-with-a-item-id)
     - [Calling countObjects(options, onSuccess, onError) with no options](#test-cases-for-node-dri-package-calling-countobjectsoptions-onsuccess-onerror-with-no-options)
     - [Calling query(field, value, onSuccess, onError) ](#test-cases-for-node-dri-package-calling-queryfield-value-onsuccess-onerror-)
     - [Calling lastCreated(onSuccess, onError) ](#test-cases-for-node-dri-package-calling-lastcreatedonsuccess-onerror-)
     - [Calling lastEdited(onSuccess, onError) ](#test-cases-for-node-dri-package-calling-lasteditedonsuccess-onerror-)
     - [Calling lastCreatedByType(type, onSuccess, onError) ](#test-cases-for-node-dri-package-calling-lastcreatedbytypetype-onsuccess-onerror-)
     - [Calling lastEditedByType(type, onSuccess, onError) ](#test-cases-for-node-dri-package-calling-lasteditedbytypetype-onsuccess-onerror-)
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
					titleInfo : [{
						title : "AutoTestColl" + rnd,
						subtitle : "SubAutoTestColl" + rnd
					}]
				},
				status : "open",
				type : "collection"
			};
			dri.createObject(data, function(result) {
				result.should.be.ok
				assert.lengthOf(result, 24)
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
					titleInfo : [{
						title : "AutoTestSeries" + rnd,
						subtitle : "SubAutoTestSeries" + rnd
					}]
				},
				status : "open",
				type : "series",
				parentId : collId
			};
			dri.createObject(data, function(result) {
				result.should.be.ok
				assert.lengthOf(result, 24)
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
					titleInfo : [{
						title : "AutoTestItem" + rnd,
						subtitle : "SubAutoTestItem" + rnd
					}]
				},
				status : "open",
				type : "item",
				parentId : seriesId
			};
			dri.createObject(data, function(result) {
				result.should.be.ok
				assert.lengthOf(result, 24)
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

<a name="test-cases-for-node-dri-package-calling-getobjectid-onsuccess-onerror-to-get-an-item-and-convert-to-dublin-core" />
## Calling getObject(id, onSuccess, onError) to get an item and convert to Dublin Core
should get an Item and return the Item in DC.

```js
			dri.getObject(itemId, function(result) {
				var dc = dri.convertToDC(result)
				assert.include(dc, itemId)
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-calling-getobjectid-onsuccess-onerror-to-get-an-item-and-convert-to-mods" />
## Calling getObject(id, onSuccess, onError) to get an item and convert to MODS
should get an Item and return the Item in MODS.

```js
			dri.getObject(itemId, function(result) {
				var dc = dri.convertToMODS(result)
				assert.include(dc, itemId)
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
			dri.getChildren(seriesId, 0, 20, function(result) {
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

<a name="test-cases-for-node-dri-package-calling-countobjectsoptions-onsuccess-onerror-with-no-options" />
## Calling countObjects(options, onSuccess, onError) with no options
should return the amount of objects in MongoDB.

```js
			dri.countObjects({}, function(amount) {
				assert.isNumber(amount)
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

<a name="test-cases-for-node-dri-package-calling-queryfield-value-onsuccess-onerror-" />
## Calling query(field, value, onSuccess, onError) 
should return an array containing objects that contain the searched field.

```js
			dri.query("label", "50c25df5b", function(data) {
				should.exist(data)
				assert.include(data[0], "label");
				assert.include(data[0], "e2f");
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

<a name="test-cases-for-node-dri-package-calling-lastcreatedonsuccess-onerror-" />
## Calling lastCreated(onSuccess, onError) 
should return an array containing the last 5 created objects.

```js
			dri.lastCreated(function(data) {
				should.exist(data)
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

<a name="test-cases-for-node-dri-package-calling-lasteditedonsuccess-onerror-" />
## Calling lastEdited(onSuccess, onError) 
should return an array containing the last 5 edited objects.

```js
			dri.lastEdited(function(data) {
				should.exist(data)
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

<a name="test-cases-for-node-dri-package-calling-lastcreatedbytypetype-onsuccess-onerror-" />
## Calling lastCreatedByType(type, onSuccess, onError) 
should return an array containing the last 5 created items.

```js
			dri.lastCreatedByType("item",function(data) {
				should.exist(data)
				assert.include(data[0], "item");
				done();
			}, function(err) {
				should.not.exist(e);
				done();
			});
```

<a name="test-cases-for-node-dri-package-calling-lasteditedbytypetype-onsuccess-onerror-" />
## Calling lastEditedByType(type, onSuccess, onError) 
should return an array containing the last 5 edited items.

```js
			dri.lastEditedByType("item",function(data) {
				should.exist(data)
				assert.include(data[0], "item");
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

make[2]: Leaving directory `/data/home/jtang/develop/dris-workflows-site/build/node-dri'
