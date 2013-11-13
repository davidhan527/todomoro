class Todomoro.Routers.Tasks extends Backbone.Router
  routes:
    '': 'index'
    'tasks/:id': 'show'

  initialize: ->
    @collection = new Todomoro.Collections.Tasks()
    @collection.reset($('#container').data 'tasks')

  index: ->
    view = new Todomoro.Views.TasksIndex(collection: @collection)
    $('#container').html(view.render().el)
    # This will render the index.jst.eco template into our container div. 

  show: (id) ->
    # view = new Todomoro.Views.
    alert "Task #{id}"