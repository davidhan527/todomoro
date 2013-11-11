class Todomoro.Collections.Tasks extends Backbone.Collection
# A collection contains multiple models and provides some conveniences for managing them. We’ll set the url option on our Entries collection. This is the URL that it expects the server to respond to for managing this collection of records and it expects it to be a JSON REST API.

  url: '/api/tasks'
# When this class fetches the records it will send a GET request to this URL. Similarly when it creates a new record it will send a POST request to it. To fetch a single Entry it will send a GET request to /api/entries/<entry_id> and it will also use that URL to update an entity, with PUT, or delete it with DELETE. This means that it works in the same way that a REST interface in Rails does. Note that we’ve mapped this under an /api path so that there’s no potential conflict with the Backbone routing.

  model: Todomoro.Models.Task

