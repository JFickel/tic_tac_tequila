$(document).ready(function() {
  $('form.signup').on('submit', function(e) {
    e.preventDefault();
    $.post('/signup', $(this).serialize()).done( function(response) {
      $('#confirmation').html(response);
    });
  });


  $('form.signin').on('submit', function(e) {
    e.preventDefault();
    $.post('/signin', $(this).serialize()).done( function(response) {
      if (response === 'nope') {
        $('#confirmation').html('Invalid Username and Password Combination');
      }
      else {
        window.location.replace('/main');
      }
    });
  });
});
