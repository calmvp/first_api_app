$(document).ready(function() {
  $('#submit_username').on('submit',  function(event){
  	event.preventDefault();
  	alert('clicked')
  	$(this).remove();
  	$('.container').append("<img src='/../images/ajax_loader.gif'>");
  	$.post('/1', $(this).serialize(), function(response){
  		$('body').html(response);
  	});
  });
});
