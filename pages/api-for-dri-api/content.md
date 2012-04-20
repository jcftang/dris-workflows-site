make[2]: Entering directory `/data/home/jtang/develop/dris-workflows-site/build/dri-api'
aFedoraLib:12
# TOC
   - [Tests for DRI APIv2](#tests-for-dri-apiv2)
     - [GET /](#tests-for-dri-apiv2-get-)
     - [POST /dev/objects type = collection](#tests-for-dri-apiv2-post-devobjects-type--collection)
     - [POST /dev/objects type = series](#tests-for-dri-apiv2-post-devobjects-type--series)
     - [POST /dev/objects type = item](#tests-for-dri-apiv2-post-devobjects-type--item)
     - [POST /dev/objects/:id/update](#tests-for-dri-apiv2-post-devobjectsidupdate)
     - [GET /dev/objects](#tests-for-dri-apiv2-get-devobjects)
     - [GET /dev/objects/:id](#tests-for-dri-apiv2-get-devobjectsid)
     - [GET /dev/objects/:id.dc](#tests-for-dri-apiv2-get-devobjectsiddc)
     - [GET /dev/objects/:id/list](#tests-for-dri-apiv2-get-devobjectsidlist)
     - [GET /dev/objects/:id/approve](#tests-for-dri-apiv2-get-devobjectsidapprove)
     - [GET /dev/objects/:id/delete](#tests-for-dri-apiv2-get-devobjectsiddelete)
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

<a name="tests-for-dri-apiv2-post-devobjects-type--collection" />
## POST /dev/objects type = collection
should respond with the id of the created object.

```js

			request({
				method : 'POST',
				uri : socket + '/dev/objects',
				json : {
					"status" : "open",
					"properties" : {
						"title" : "AutoTestSeries",
						"subtitle" : "AutoTestSeries"
					},
					"type" : "collection"
				}
			}, function(err, resp, body) {

				assert.isNull(err);
				assert.isDefined(body);
				assert.length(body, 24);
				collectionId = body;
				done();
			});
```

<a name="tests-for-dri-apiv2-post-devobjects-type--series" />
## POST /dev/objects type = series
should respond with the id of the created object.

```js

			request({
				method : 'POST',
				uri : socket + '/dev/objects',
				json : {
					"status" : "open",
					"properties" : {
						"title" : "AutoTestItem",
						"subtitle" : "AutoTestItem"
					},
					"type" : "series",
					parentId : collectionId
				}
			}, function(err, resp, body) {

				assert.isNull(err);
				assert.isDefined(body);
				assert.length(body, 24);
				seriesId = body;
				done();
			});
```

<a name="tests-for-dri-apiv2-post-devobjects-type--item" />
## POST /dev/objects type = item
should respond with the id of the created object.

```js
			request({
				method : 'POST',
				uri : socket + '/dev/objects',
				json : {
					"status" : "open",
					"properties" : {
						"title" : "AutoTestColl",
						"subtitle" : "AutoTestColl"
					},
					"type" : "item",
					parentId : seriesId
				}
			}, function(err, resp, body) {

				assert.isNull(err);
				assert.isDefined(body);
				assert.length(body, 24);
				itemId = body;
				done();
			});
```

<a name="tests-for-dri-apiv2-post-devobjectsidupdate" />
## POST /dev/objects/:id/update
should respond with the id of the updated object.

```js
			request({
				method : 'POST',
				uri : socket + '/dev/objects/' + collectionId + '/update',
				json : {
					"status":"open",
					"properties" : {
						"title" : "I updated this collection",
						"subtitle" : "AutoTestSeries"
					}
				}
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.equal(body, 1);
				assert.isDefined(body);
				done();
			});
```

<a name="tests-for-dri-apiv2-post-devobjectsidupdate" />
## POST /dev/objects/:id/update
should respond with the id of the updated object.

```js
			request({
				method : 'POST',
				uri : socket + '/dev/objects/' + seriesId + '/update',
				json : {
					properties : {
						title : "I updated this series"
					}
				}
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.equal(body, 1);
				assert.isDefined(body);
				done();
			});
```

<a name="tests-for-dri-apiv2-post-devobjectsidupdate" />
## POST /dev/objects/:id/update
should respond with the id of the updated object.

```js
			request({
				method : 'POST',
				uri : socket + '/dev/objects/' + seriesId + '/update',
				json : {
					properties : {
						title : "I updated this item"
					}
				}
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.equal(body, 1);
				assert.isDefined(body);
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devobjects" />
## GET /dev/objects
should respond with the an array with all the top level objects.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/objects'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, '_id');
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devobjectsid" />
## GET /dev/objects/:id
should respond with the JSON of the selected object.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/objects/' + collectionId
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, collectionId);
				assert.include(body, 'updated');
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devobjectsiddc" />
## GET /dev/objects/:id.dc
should respond with the Dublin core XML of the selected object.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/objects/' + collectionId + '.dc'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, collectionId);
				assert.include(body, 'dc:');
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devobjectsidlist" />
## GET /dev/objects/:id/list
should respond with the an array with all the children items.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/objects/' + collectionId + '/list'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, collectionId);
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devobjectsidapprove" />
## GET /dev/objects/:id/approve
should respond with the Fedora pid.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/objects/' + collectionId + '/approve'
			}, function(err, resp, body) {
				assert.isNull(err);
				console.log(body)
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devobjectsiddelete" />
## GET /dev/objects/:id/delete
should respond with the id of the deleted object.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/objects/' + collectionId + '/delete'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, collectionId);
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devobjectsiddelete" />
## GET /dev/objects/:id/delete
should respond with the id of the deleted object.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/objects/' + seriesId + '/delete'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, seriesId);
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devobjectsiddelete" />
## GET /dev/objects/:id/delete
should respond with the id of the deleted object.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/objects/' + itemId + '/delete'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, itemId);
				done();
			});
```

make[2]: Leaving directory `/data/home/jtang/develop/dris-workflows-site/build/dri-api'
