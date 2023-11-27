# API Contracts - JSON format

GET /blogs - Lists all blogs

Expected response:

```
[ 
  { 
    "id":1,
    "title":"First Blog",
    "subheader":null,
    "body":"This is the first blog",
    "created_at":"2023-11-27T06:25:26.736Z",
    "updated_at":"2023-11-27T06:25:26.736Z"
    },
    {
      "id":2,
      "title":"Second Blog",
      "subheader":"A sequel to the first one",
      "body":"This is the second blog",
      "created_at":"2023-11-27T06:25:26.755Z",
      "updated_at":"2023-11-27T06:25:26.755Z"
    }...]
```
GET /blogs/:id - Display blog with :id

Expected parameters:

```
  params: { :id }
```

Expected response:
```
{ 
  "id":1,
  "title":"First Blog",
  "subheader":null,
  "body":"This is the first blog",
  "created_at":"2023-11-27T06:25:26.736Z",
  "updated_at":"2023-11-27T06:25:26.736Z"
}
```

POST /blogs/ - Create a new blog

Expected parameters:

```
  params: { 
    title: string (required),
    body: text (required), 
    subheader: string,
  }
```

PATCH /blogs/:id - Update an existing blog

Expected parameters:

```
  params: {
    id: integer (required), 
    title: string,
    body: text, 
    subheader: string,
  }
```

GET /blogs/search - Search for blogs containing the specified keyword in title, body, and subheader

Expected parameters:

```
  params: { query: string (required) }
```

DELETE /blogs/:id - Delete a specific blog

Expected parameters:

```
  params: { :id }
```