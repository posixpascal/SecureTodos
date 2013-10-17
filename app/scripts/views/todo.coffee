'use strict';

class SecureTodos.Views.TodoView extends Backbone.View
	id: "todo-view"
	el: "div#todo-view"
	template: JST["app/scripts/templates/todo.ejs"]
	render: () ->

		if typeof @model == "undefined"
			html = @template()
		else
			html = @template(@model.attributes)
		
		@$el.html html
		@
	
	
	

class SecureTodos.Views.NewTodoView extends SecureTodos.Views.TodoView
	template: JST["app/scripts/templates/new_todo.ejs"]
	

class SecureTodos.Views.SearchTodoView extends SecureTodos.Views.TodoView
	template: JST["app/scripts/templates/search_todo.ejs"]


	
