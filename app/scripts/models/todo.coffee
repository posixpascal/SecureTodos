'use strict';

@UUID = 0
class SecureTodos.Models.TodoModel extends Backbone.Model
	
	getTitle: ->
		@get("title")
	
	setTitle: (title) ->
		@set
			title: title
			
			
	
	isDone: ->
		!!@get("isDone")
	
	setDone: (done) ->
		@set
			isDone: done
			
			
	
$ ->
	