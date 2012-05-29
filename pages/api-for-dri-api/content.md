make[2]: Entering directory `/data/home/jtang/develop/dris-workflows-site/build/dri-api'
MongoDB: mongodb://localhost/dri
DRI package configured
info: result
# TOC
   - [Tests for DRI APIv2](#tests-for-dri-apiv2)
     - [GET /](#tests-for-dri-apiv2-get-)
     - [POST /dev/objects type = collection](#tests-for-dri-apiv2-post-devobjects-type--collection)
     - [POST /dev/objects type = series](#tests-for-dri-apiv2-post-devobjects-type--series)
     - [POST /dev/objects type = item](#tests-for-dri-apiv2-post-devobjects-type--item)
     - [POST /dev/upload type = item with binary object](#tests-for-dri-apiv2-post-devupload-type--item-with-binary-object)
     - [POST /dev/objects/:id/update](#tests-for-dri-apiv2-post-devobjectsidupdate)
     - [GET /dev/objects](#tests-for-dri-apiv2-get-devobjects)
     - [GET /dev/objects/:id](#tests-for-dri-apiv2-get-devobjectsid)
     - [GET /dev/objects/:id.dc](#tests-for-dri-apiv2-get-devobjectsiddc)
     - [GET /dev/objects/:id/list](#tests-for-dri-apiv2-get-devobjectsidlist)
     - [GET /dev/objects/:id/approve](#tests-for-dri-apiv2-get-devobjectsidapprove)
     - [GET /dev/stats](#tests-for-dri-apiv2-get-devstats)
     - [GET /dev/stats/approved](#tests-for-dri-apiv2-get-devstatsapproved)
     - [GET /dev/stats/open](#tests-for-dri-apiv2-get-devstatsopen)
     - [GET /dev/stats/lastedited](#tests-for-dri-apiv2-get-devstatslastedited)
     - [GET /dev/stats/lastcreated](#tests-for-dri-apiv2-get-devstatslastcreated)
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
					status : "open",
					type : "collection",
					properties : {
						titleInfo : [{
							title : "This is a Collection title!"
						}]
					}
				}
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isDefined(body);
				assert.lengthOf(body, 24);
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
					status : "open",
					type : "series",
					properties : {
						titleInfo : [{
							title : "This is a Series title!"
						}]
					},
					parentId : collectionId
				}
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isDefined(body);
				assert.lengthOf(body, 24);
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
					status : "open",
					properties : {
						titleInfo : [{
							title : "This is a item title!"
						}]
					},
					"type" : "item",
					parentId : seriesId
				}
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isDefined(body);
				assert.lengthOf(body, 24);
				itemId = body;
				done();
			});
```

<a name="tests-for-dri-apiv2-post-devupload-type--item-with-binary-object" />
## POST /dev/upload type = item with binary object
should respond with the path of the uploaded file.

```js
			var req = superagent.post(socket + '/dev/upload').attach(__dirname + '/car.jpg', 'upload')
			req.end(function(resp) {
				assert.isDefined(resp.text);
				assert.include(resp, "car.jpg");
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
					status : "open",
					properties : {
						titleInfo : [{
							title : "This is a updated collection title!"
						}]
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
					status : "open",
					properties : {
						titleInfo : [{
							title : "This is a updated series title!"
						}]
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
				uri : socket + '/dev/objects/' + itemId + '/update',
				json : {
					status : "open",
					properties : {
						titleInfo : [{
							title : "This is a updated item title!"
						}]
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
				assert.include(body, "This is a updated collection title!");
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devstats" />
## GET /dev/stats
should respond with the total amount of objects in mongodb.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/stats'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isString(body);
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devstatsapproved" />
## GET /dev/stats/approved
should respond with the total amount of objects in mongodb that have been pushed to fedora.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/stats/approved'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isString(body);
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devstatsopen" />
## GET /dev/stats/open
should respond with the total amount of objects in mongodb that are open.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/objects/stats/open'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isString(body);
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devstatslastedited" />
## GET /dev/stats/lastedited
should respond with a list of the last edited objects.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/stats/lastedited'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isString(body);
				done();
			});
```

<a name="tests-for-dri-apiv2-get-devstatslastcreated" />
## GET /dev/stats/lastcreated
should respond with a list of the last created objects.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/stats/lastcreated'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isString(body);
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
