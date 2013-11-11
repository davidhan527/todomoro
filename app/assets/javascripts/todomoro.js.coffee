window.Todomoro =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Todomoro.Routers.Tasks
    Backbone.history.start()

$(document).ready ->
  Todomoro.initialize()
