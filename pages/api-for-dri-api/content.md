Express test server listening on port 4001 in test mode
# TOC
   - [APIv2 tests](#apiv2-tests)
     - [GET /](#apiv2-tests-get-)
     - [POST /dev/collections](#apiv2-tests-post-devcollections)
     - [POST /dev/collections/:id/series](#apiv2-tests-post-devcollectionsidseries)
     - [POST /dev/collections/:id/series/:id/items](#apiv2-tests-post-devcollectionsidseriesiditems)
     - [PUT /dev/collections/:id/series/:id/items/:id](#apiv2-tests-put-devcollectionsidseriesiditemsid)
     - [PUT /dev/collections/:id/series/:id](#apiv2-tests-put-devcollectionsidseriesid)
     - [PUT /dev/collections/:id](#apiv2-tests-put-devcollectionsid)
     - [GET /dev/collections](#apiv2-tests-get-devcollections)
     - [GET /dev/collections/:id](#apiv2-tests-get-devcollectionsid)
     - [GET /dev/collections/:id/series](#apiv2-tests-get-devcollectionsidseries)
     - [GET /dev/collections/:id/series/:id](#apiv2-tests-get-devcollectionsidseriesid)
     - [GET /dev/collections/:id/series/:id/items](#apiv2-tests-get-devcollectionsidseriesiditems)
     - [GET /dev/collections/:id/series/:id/items/:id](#apiv2-tests-get-devcollectionsidseriesiditemsid)
     - [DELETE /dev/collections/:id/series/:id/items/:id](#apiv2-tests-delete-devcollectionsidseriesiditemsid)
     - [DELETE /dev/collections/:id/series/:id](#apiv2-tests-delete-devcollectionsidseriesid)
     - [DELETE /dev/collections/:id](#apiv2-tests-delete-devcollectionsid)
<a name="" />
 
<a name="apiv2-tests" />
# APIv2 tests
<a name="apiv2-tests-get-" />
## GET /
should respond with the documentation page.

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

<a name="apiv2-tests-post-devcollections" />
## POST /dev/collections
should respond with the id of the created collection.

```js
			request({
				method : 'POST',
				uri : socket + '/dev/collections',
				form : {
					Title : 'Autobot collection'
				}
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isDefined(body);
				assert.length(body, 24);
				collectionId = body;
				done();
			});
```

<a name="apiv2-tests-post-devcollectionsidseries" />
## POST /dev/collections/:id/series
should respond with the id of the created series.

```js
			request({
				method : 'POST',
				uri : socket + '/dev/collections/' + collectionId + '/series',
				form : {
					Title : 'Autobot series',
					author : 'Autobot',
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

<a name="apiv2-tests-post-devcollectionsidseriesiditems" />
## POST /dev/collections/:id/series/:id/items
should respond with the id of the created item.

```js
			request({
				method : 'POST',
				uri : socket + '/dev/collections/' + collectionId + '/series/' + seriesId + '/items',
				form : {
					Title : 'Autobot title',
					Subtitle : 'Autobot Subtitle',
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

<a name="apiv2-tests-put-devcollectionsidseriesiditemsid" />
## PUT /dev/collections/:id/series/:id/items/:id
should respond with the id of the updated item.

```js
			request({
				method : 'PUT',
				uri : socket + '/dev/collections/' + collectionId + '/series/' + seriesId + '/items/' + itemId,
				form : {
					_id : itemId,
					Title : 'Autobot titleUpdate',
					Subtitle : 'Autobot Subtitle',
					update : 'update',
					type : 'item',
					parentId : seriesId
				}
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isDefined(body);
				assert.length(body, 24);
				done();
			});
```

<a name="apiv2-tests-put-devcollectionsidseriesid" />
## PUT /dev/collections/:id/series/:id
should respond with the id of the updated series.

```js
			request({
				method : 'PUT',
				uri : socket + '/dev/collections/' + collectionId + '/series/' + seriesId,
				form : {
					_id : seriesId,
					Title : 'Autobot seriesUpdate',
					author : 'Autobot',
					update : 'update',
					type : 'series',
					parentId : collectionId
				}
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isDefined(body);
				assert.length(body, 24);
				done();
			});
```

<a name="apiv2-tests-put-devcollectionsid" />
## PUT /dev/collections/:id
should respond with the id of the updated series.

```js
			request({
				method : 'PUT',
				uri : socket + '/dev/collections/' + collectionId,
				form : {
					_id : collectionId,
					Title : 'Autobot collectionUpdate',
					type : 'collection',
					update : 'update'
				}
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.isDefined(body);
				assert.length(body, 24);
				done();
			});
```

<a name="apiv2-tests-get-devcollections" />
## GET /dev/collections
should respond with an array of all the collections.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/collections'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, collectionId);
				assert.include(body, "Autobot collectionUpdate");
				assert.include(body, "update");
				done();
			});
```

<a name="apiv2-tests-get-devcollectionsid" />
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
				assert.equal(json.Title, "Autobot collectionUpdate");
				assert.equal(json.update, "update");
				done();
			});
```

<a name="apiv2-tests-get-devcollectionsidseries" />
## GET /dev/collections/:id/series
should respond with an array of all the series corresponding to the given id.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/collections/' + collectionId + '/series'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, seriesId);
				assert.include(body, "Autobot seriesUpdate");
				assert.include(body, "update");
				done();
			});
```

<a name="apiv2-tests-get-devcollectionsidseriesid" />
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
				assert.equal(json.Title, "Autobot seriesUpdate");
				assert.equal(json.update, "update");
				done();
			});
```

<a name="apiv2-tests-get-devcollectionsidseriesiditems" />
## GET /dev/collections/:id/series/:id/items
should respond with an array of all the items corresponding to the given ids.

```js
			request({
				method : 'GET',
				uri : socket + '/dev/collections/' + collectionId + '/series/' + seriesId + '/items'
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, itemId);
				assert.include(body, "Autobot titleUpdate");
				assert.include(body, "update");
				done();
			});
```

<a name="apiv2-tests-get-devcollectionsidseriesiditemsid" />
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
				assert.equal(json.Title, "Autobot titleUpdate");
				assert.equal(json.update, "update");
				done();
			});
```

<a name="apiv2-tests-delete-devcollectionsidseriesiditemsid" />
## DELETE /dev/collections/:id/series/:id/items/:id
should respond with the id of the deleted item.

```js
			request({
				method : 'DELETE',
				uri : socket + '/dev/collections/' + collectionId + '/series/' + seriesId + '/items/' + itemId
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, itemId);
				assert.length(body, 24);
				done();
			});
```

<a name="apiv2-tests-delete-devcollectionsidseriesid" />
## DELETE /dev/collections/:id/series/:id
should respond with the id of the deleted series.

```js
			request({
				method : 'DELETE',
				uri : socket + '/dev/collections/' + collectionId + '/series/' + seriesId
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, seriesId);
				assert.length(body, 24);
				done();
			});
```

<a name="apiv2-tests-delete-devcollectionsid" />
## DELETE /dev/collections/:id
should respond with the id of the deleted collection.

```js
			request({
				method : 'DELETE',
				uri : socket + '/dev/collections/' + collectionId
			}, function(err, resp, body) {
				assert.isNull(err);
				assert.include(body, collectionId);
				assert.length(body, 24);
				done();
			});
```

