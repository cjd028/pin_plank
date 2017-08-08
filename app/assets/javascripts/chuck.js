$(document).ready(function(){
  console.log("hi");

  $('#chuckBtn').on('click', function() {
    console.log('working')
    $.ajax({
      type: "GET",
      url: 'https://api.chucknorris.io/jokes/random',
      success: function(response) {
        console.log(response)
        $('#joke').html(response.value)
      }
    })
  })
});