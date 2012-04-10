rem
rem
rem
rem
rem
# TOC
   - [Test cases for node-dri package](#test-cases-for-node-dri-package)
     - [Creating a Collection](#test-cases-for-node-dri-package-creating-a-collection)
     - [Creating a Series](#test-cases-for-node-dri-package-creating-a-series)
     - [Creating an Item](#test-cases-for-node-dri-package-creating-an-item)
     - [Getting an Item](#test-cases-for-node-dri-package-getting-an-item)
     - [Inserting an Item](#test-cases-for-node-dri-package-inserting-an-item)
     - [Getting all children of a parent item](#test-cases-for-node-dri-package-getting-all-children-of-a-parent-item)
     - [Pushing the item into fedora](#test-cases-for-node-dri-package-pushing-the-item-into-fedora)
     - [Getting items from a certain type](#test-cases-for-node-dri-package-getting-items-from-a-certain-type)
     - [Removing an item and children items](#test-cases-for-node-dri-package-removing-an-item-and-children-items)
     - [Removing a colection and children series and/or items](#test-cases-for-node-dri-package-removing-a-colection-and-children-series-andor-items)
     - [Getting all media files](#test-cases-for-node-dri-package-getting-all-media-files)
<a name="" />
 
<a name="test-cases-for-node-dri-package" />
# Test cases for node-dri package
<a name="test-cases-for-node-dri-package-creating-a-collection" />
## Creating a Collection
should create a collection and return the id of the collection.

```js
			var data = {};
			data.Title = "AutoTestColl" + rnd;
			data.type = "collection";
			dri.createCollection(data, function(result) {
				result.should.be.ok
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
				collection : collId,
				Title : "AutoTestSeries" + rnd,
				author : "AutoBot",
				type : "series"
			};
			dri.createSeries(data, function(result) {
				result.should.be.ok
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
				parentId : seriesId,
				Title : "AutoBotTitle" + rnd,
				Subtitle : "AutoBotSubitle" + rnd,
				objectId : rnd,
				type : "item"
			};
			dri.createItem(data, function(result) {
				result.should.be.ok
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
			dri.getItem(itemId, function(result) {
				should.equal(itemId, result._id);
				done();
			}, function(e) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-inserting-an-item" />
## Inserting an Item
Should create the new item, update the position of the other items and return the id of the created item.

```js
			var data = {
				amount : 10,
				parentId : seriesId,
				objectId : 0,
				Title : "AutoBotTitle" + rnd,
				Subtitle : "AutoBotSubitle" + rnd,
				type : "item"
			};
			for(var i = 0; i < data.amount; i++) {
				data.objectId = data.objectId +i;
				dri.createItem(data, function(result) {
					result.should.be.ok;
				}, function(e) {
					should.not.exist(e);
				});
			}
			data.objectId = 3;
			dri.updateIdOrder(data.parentId, data.objectId, 1, function(amount) {
				amount.should.be.a("number");
				dri.createItem(data, function(id) {
					dri.getItems(seriesId, function(result) {
						var str = result.length;
						should.equal(str, 12);
						done();
					}, function(e) {
						should.not.exist(e);
						done();
					});
				}, function(e) {
					should.not.exist(e);
					done();
				});
			})
```

<a name="test-cases-for-node-dri-package-getting-all-children-of-a-parent-item" />
## Getting all children of a parent item
should get an array of children.

```js
			dri.getItems(seriesId, function(result) {
				var str = result[0].parentId;
				should.equal(str, seriesId);
				done();
			}, function(e) {
				should.not.exist(e);
				done();
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

<a name="test-cases-for-node-dri-package-getting-items-from-a-certain-type" />
## Getting items from a certain type
should return an array of items from a certain type (here series).

```js
			dri.getAllRecordsByType("series", function(data) {
				should.equal(data[0].type, "series");
				done();
			});
```

<a name="test-cases-for-node-dri-package-removing-an-item-and-children-items" />
## Removing an item and children items
should return the id of the removed item.

```js
			dri.removeItem(seriesId, function(id) {
				should.equal(seriesId, id);
			}, function(err) {
				should.not.exist(e);
			});
```

<a name="test-cases-for-node-dri-package-removing-an-item-and-children-items" />
## Removing an item and children items
should return the id of the removed item.

```js
			dri.removeItem(itemId, function(id) {
				should.equal(itemId, id);
			}, function(err) {
				should.not.exist(e);

			});
```

<a name="test-cases-for-node-dri-package-removing-a-colection-and-children-series-andor-items" />
## Removing a colection and children series and/or items
should return the id of the removed collection.

```js
			
				dri.removeItem(collId, function(id) {
				should.equal(collId, id);
			}, function(err) {
				should.not.exist(e);

			});
```

<a name="test-cases-for-node-dri-package-getting-all-media-files" />
## Getting all media files
should return an array with the media files metadata.

```js
			dri.getAllMediaItems(function(data) {
				should.exist(data);
				done();
			});
```

