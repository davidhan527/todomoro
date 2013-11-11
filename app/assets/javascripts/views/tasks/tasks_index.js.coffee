class Todomoro.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']
# This view has a template option set to tasks/index. This means that it will use the index template at /app/assets/javascripts/templates/tasks/index.jst.eco to render out the view. This template file is where the actual HTML code goes; the view just contains CoffeeScript. This might be a little confusing if you’re coming from Rails as the views in Backbone behave more like controllers in Rails, setting up data for the actual template and handling events. We need to tell the view how to render the template and we do so by using a render function.
  render: ->
    $(@el).html(@template(tasks: "tasks go here"))
    # we can pass an object with attributes into @template()
    this

# To render a template we call @template() which renders the template and returns it as a string. Each view has a dedicated HTML element that we access by calling @el. By using some jQuery code we can set the contents of this element to by whatever is returned by the template. Finally this function needs to return this view so that we can chain other view functions on it and to do this we return this (as this is CoffeeScript we could also use @ but we’ll stick with this here).


