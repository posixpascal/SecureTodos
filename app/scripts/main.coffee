
window.SecureTodos =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
  
	init: (options) ->
		'use strict'
	
	
		if localStorage.getItem("hsecret") == null
			@token = ""
			@token_parts_length = 0
			$("#rsa-placeholder").html """
			<div id="rsa">
				<div class="rsa-view">
					<center><span class="vertical-aligned">MOVE CURSOR HERE</span></center>
				</div>
				<div class="progress">
				  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    <span class="sr-only">0% Complete</span>
				  </div>
				</div>
			</div>
			"""
			$(".rsa-view").on("mousemove", SecureTodos.tokenizer)
		else
			$("#rsa").hide()
			$(".heading").html "Secret: <small onclick=\"if (confirm('Neuen Key erstellen?')){ localStorage.removeItem('hsecret'); window.location.href = '/';}\"}>#{localStorage.getItem("hsecret")}</small>"

	
	shuffle: (array) ->
		currentIndex = array.length
		
		while 0 isnt currentIndex
			randomIndex = Math.floor (Math.random() * currentIndex)
			currentIndex -= 1
			
			temporaryValue = array[currentIndex]
			array[currentIndex] = array[randomIndex]
			array[randomIndex] = temporaryValue
		array
		
	generateToken: ->
		$(".rsa-view span").html("Generating Token..")
		$(".progress").addClass("progress-striped active")
		@message = @shuffle(@token.split("")).join("")
		hash = CryptoJS.SHA3(@message, { outputLength: 512 });
		@secret_hash = hash
		$("#rsa").fadeOut("slow")
		
		localStorage.setItem("hsecret", @secret_hash)
		$(".heading").html "Secret: <small onclick=\"if (confirm('Neuen Key erstellen?')){ localStorage.removeItem('hsecret'); window.location.href = '/';}\"}>#{localStorage.getItem("hsecret")}</small>"
		
		
	tokenizer: (event) ->
		x = event.pageX
		y = event.pageY
		t = new Date().getTime()
		
		data = SecureTodos.shuffle([x,y,t]).join("")
		SecureTodos.token += data
		
		
		SecureTodos.token_parts_length++
		$(".progress .progress-bar").css("width", (SecureTodos.token_parts_length / 1) + "%")
		
		if (SecureTodos.token_parts_length > 100)
			$(".rsa-view").off("mousemove")
			SecureTodos.generateToken()
		
$ ->
	'use strict'
	SecureTodos.init
  		generate_token: true
  
  
	$("body").on 'click', "[data-fold]", ->
		$(".#{$(this).data("fold")}").fadeToggle()
		
  
  