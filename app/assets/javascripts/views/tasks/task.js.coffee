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
    'click .fa-stack': 'delete_task'
    'click [type="checkbox"]':'completed',

  render: ->
    $(@el).html(@template(task: @model))
    this

  startTimer: () ->
    bb_var.id = @model.get('id')
    timer_start(25)
    $('#countdown_container').foundation('reveal', 'open');

  delete_task: ->
    # Backbone.history.navigate("entries/#{@model.get('id')}", true)
    if confirm("Are you sure?")
      @model.destroy
        success: (model, response) ->
          console.log model

  remove: ->
    @$el.remove();

  completed: ->
    @model.set({'completed': true})
    @model.save()
    # $('#completed_tasks').append(@$el)

