'use strict';

class SecureTodos.Routers.TodoRouter extends Backbone.Router
	routes:
		"": "index"
		"/": "index"
		"/home": "index"
		
		"todo/new": "new_todo"
		"todo/:uuid": "view_todo"
		"search": "search_todo"
		"search/:query": "search_todo_by_query"
		
		
	index: ->
		new SecureTodos.Views.IndexView().render()
		
	view_todo: (uuid) ->
		todoView = new SecureTodos.Views.TodoView
			model: SecureTodos.TodoCollection.findWhere
						uuid: parseInt(uuid)
				
		todoView.render()
		
	new_todo: ->
		new SecureTodos.Views.NewTodoView().render()
	
	search_todo: ->
		new SecureTodos.Views.SearchTodoView().render()
		
	search_todo_by_query: (query) ->
		alert query
	
# export router
SecureTodos.TodoRouter = new SecureTodos.Routers.TodoRouter()
$ ->
	Backbone.history.start()

