class Todomoro.Routers.Tasks extends Backbone.Router
  routes:
    '': 'index'
    'tasks/:id': 'show'
                
  index: ->
    view = new Todomoro.Views.TasksIndex()
    $('#container').html(view.render().el)
    # This will render the index.jst.eco template into our container div. 

  show: (id) ->
    alert "Task #{id}"