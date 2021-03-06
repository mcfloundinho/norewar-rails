# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready.push ->
	$('#login_lst').click ->
		$('#login_form').slideToggle()

	show_welcome = (name) ->
		$('#welcome_txt').text "Welcome, #{name}!"
		$('#login_form').hide()
		$('#login_lst').hide()
		$('#welcome_span').show()
		$('#username_txt').val ''
		$('#password_txt').val ''

	$('#log_btn').click ->
		$.ajax
			url: '/users/login'
			type: 'POST'
			data:
				name:		$('#username_txt').val()
				password:	$('#password_txt').val()
			dataType: 'json'
			success: (res) ->
				show_welcome $('#username_txt').val() if res.success
				Messenger.connect()

	$('#reg_btn').click ->
		$.ajax
			url: '/users'
			type: 'POST'
			data:
				name:		$('#username_txt').val()
				password:	$('#password_txt').val()
			dataType: 'json'
			success: (res) ->
				show_welcome $('#username_txt').val() if res.success

	if $('#secret').text() is 'on' && !Messenger.connected()
		Messenger.connect()
