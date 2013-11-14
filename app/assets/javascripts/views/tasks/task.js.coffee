class Todomoro.Views.Task extends Backbone.View
  template: JST['tasks/task']
  tagName: 'li'

  initialize: ->
    @model.on('change', @render, this);
    # listening for destroy event and once model is destroyed the view is removed using the this.remove function
    @model.on('destroy', @remove, this);

  events:
    # 'click': 'showTask'
    'click .start': 'startTimer'
    'click .fa-trash-o': 'delete_task'

  # showTask: ->
  #   id = @model.get('id')
  #   $.ajax "tasks/"+id+"/create",
  #     type: 'POST'
  #     dataType: 'json'
  #     success: (data, textStatus, jqXHR) ->
  #       testobject.data = data
  #       $('#task_'+id).html(data.count)

  render: ->
    $(@el).html(@template(task: @model))
    this

  startTimer: () ->
    bb_var.id = @model.get('id')
    console.log("[  ] =", bb_var.id );
    timer_start(25)
    $('#countdown_container').foundation('reveal', 'open');

  delete_task: ->
    # Backbone.history.navigate("entries/#{@model.get('id')}", true)
    if confirm("Are you sure?")
      @model.destroy
        success: (model, response) ->
          console.log response
          console.log model


  remove: ->
    @$el.remove();


# $("#myModal").reveal({ "closed": function () { alert("Good bye") } });
