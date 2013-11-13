class Todomoro.Views.Task extends Backbone.View
  template: JST['tasks/task']
  tagName: 'li'

  events:
    'click': 'showTask'

  showTask: ->
    id = @model.get('id')
    $.ajax "tasks/"+id+"/create",
      type: 'POST'
      dataType: 'json'
      success: (data, textStatus, jqXHR) ->
        testobject.data = data
        $('#task_'+id).html(data.count)


  render: ->
    $(@el).html(@template(task: @model))
    this