make[2]: Entering directory `/data/home/jtang/develop/dris-workflows-site/build/dri-api'
{ status: 'Open',
  properties: { title: 'AutoTestColl', subtitle: 'AutoTestColl' } }
# TOC
   - [Tests for DRI APIv2](#tests-for-dri-apiv2)
     - [GET /](#tests-for-dri-apiv2-get-)
     - [POST /dev/collections](#tests-for-dri-apiv2-post-devcollections)
     - [POST /dev/collections/:id/series](#tests-for-dri-apiv2-post-devcollectionsidseries)
     - [POST /dev/collections/:id/series/:id/items](#tests-for-dri-apiv2-post-devcollectionsidseriesiditems)
     - [GET /dev/collections](#tests-for-dri-apiv2-get-devcollections)
     - [GET /dev/collections/:id](#tests-for-dri-apiv2-get-devcollectionsid)
     - [GET /dev/collections/:id/series](#tests-for-dri-apiv2-get-devcollectionsidseries)
     - [GET /dev/collections/:id/series/:id](#tests-for-dri-apiv2-get-devcollectionsidseriesid)
     - [GET /dev/collections/:id/series/:id/items](#tests-for-dri-apiv2-get-devcollectionsidseriesiditems)
     - [GET /dev/collections/:id/series/:id/items/:id](#tests-for-dri-apiv2-get-devcollectionsidseriesiditemsid)
<a name="" />
 
<a name="tests-for-dri-apiv2" />
# Tests for DRI APIv2
<a name="tests-for-dri-apiv2-get-" />
## GET /
should respond with the root page, this is just a sanity check.

```js
			request({
				method : 'GET',
				uri : socket + '/'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, '<title>DRI API</title>');
				done();
			});
```

<a name="tests-for-dri-apiv2-post-devcollections" />
## POST /dev/collections
should respond with the id of the created collection.

```js

			request({
				method : 'POST',
				uri : socket + '/dev/collections',
				json : {
				"status" : "Open",
				"properties" : {
					"title" : "AutoTestColl",
					"subtitle" : "AutoTestColl"
				}
			}
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isDefined(body);
				assert.length(body, 24);
				collectionId = body;
				done();
			});
```

<a name="tests-for-dri-apiv2-post-devcollectionsidseries" />
## POST /dev/collections/:id/series
should respond with the id of the created series.

```js
			request({
				method : 'POST',
				uri : socket + '/dev/collections/' + collectionId + '/series',
				json : {
					properties : {
						title : "AutoTestSeries",
						subtitle : "AutoTestSeries"
					},
					status : "Open"
				}
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isDefined(body);
				assert.length(body, 24);
				seriesId = body;
				done();
			});
```

<a name="tests-for-dri-apiv2-post-devcollectionsidseriesiditems" />
## POST /dev/collections/:id/series/:id/items
should respond with the id of the created item.

```js
			request({
				method : 'POST',
				uri : socket + '/dev/collections/' + collectionId + '/series/' + seriesId + '/items',
				json : {
					properties : {
						title : "AutoTestTitle",
						subtitle : "AutoTestTitle"
					},
					status : "Open"
				}
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isDefined(body);
				assert.length(body, 24);
				itemId = body;
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devcollections" />
## GET /dev/collections
should respond with an array of all the collections.

```js

			request({
				method : 'GET',
				uri : socket + '/dev/collections'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, collectionId);
				assert.include(body, "AutoTestColl");
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devcollectionsid" />
## GET /dev/collections/:id
should respond with the array containing the data of the specified collection.

```js

			request({
				method : 'GET',
				uri : socket + '/dev/collections/' + collectionId
			}, function(err, resp, body) {
				var json = JSON.parse(body);
				assert.isNull(err);
				assert.isDefined(body);
				assert.equal(json.properties.title, "AutoTestColl");
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devcollectionsidseries" />
## GET /dev/collections/:id/series
should respond with an array of all the series corresponding to the given id.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/collections/' + collectionId + '/series'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, seriesId);
				assert.include(body, "AutoTestSeries");
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devcollectionsidseriesid" />
## GET /dev/collections/:id/series/:id
should respond with the array containing the data of the specified series.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/collections/' + collectionId + '/series/' + seriesId
			}, function(err, resp, body) {
				var json = JSON.parse(body);
				assert.isNull(err);
				assert.isDefined(body);
				assert.equal(json.properties.title, "AutoTestSeries");
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devcollectionsidseriesiditems" />
## GET /dev/collections/:id/series/:id/items
should respond with an array of all the items corresponding to the given ids.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/collections/' + collectionId + '/series/' + seriesId + '/items'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, itemId);
				assert.include(body, "AutoTestTitle");
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devcollectionsidseriesiditemsid" />
## GET /dev/collections/:id/series/:id/items/:id
should respond with the array containing the data of the specified item.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/collections/' + collectionId + '/series/' + seriesId + '/items/' + itemId
			}, function(err, resp, body) {
				var json = JSON.parse(body);
				assert.isNull(err);
				assert.isDefined(body);
				assert.equal(json.properties.title, "AutoTestTitle");
				done();
			});
```

make[2]: Leaving directory `/data/home/jtang/develop/dris-workflows-site/build/dri-api'
