'use strict';

class SecureTodos.Collections.TodoCollection extends Backbone.Collection
  model: SecureTodos.Models.TodoModel


SecureTodos.TodoCollection = new SecureTodos.Collections.TodoCollection