var testobject = {};
var bb_var = {};
var model_id;
var timer = 0;
var progress_timer = 0;
var sortEm;

var are_you_sure = function() {
  if(confirm("Are you sure?")){
    reset();
    $('a.close-reveal-modal').trigger('click');
  }
  else {

  }
};

var reset = function() {
  clearInterval(timer);
  $('#countdown').html("00:00");
};

var task_complete = function() {
  clearInterval(timer);
  $('#countdown').html("00:00");
  $.ajax("tasks/" + bb_var.id + "/create", {
    type: 'POST',
    dataType: 'json',
    success: function(data, textStatus, jqXHR) {
      testobject.data = data;
      $('#task_' + bb_var.id).html(data.count);
    }
  });
};

$(document).ready(function() {
  var minutes, seconds;
  
   
  // get tag element
  var countdown = document.getElementById("countdown");

  timer_start = function(minutes) {
    var target_date = new Date(new Date().getTime() + (minutes*60000) + 1000);
    var initial_timer = minutes;
    timer = setInterval(function () {
      // find the amount of "seconds" between now and target
      var current_date = new Date();
      
      var seconds_left = (target_date - current_date.getTime()) / 1000;

      minutes = parseInt(seconds_left / 60);
      seconds = parseInt(seconds_left % 60);

      // format countdown string + set tag value
      $countdown = $('#countdown');
      if (seconds >= 0 && seconds < 10) {
        $countdown.html(minutes + ":" +"0" + seconds);
      } else {
        $countdown.html(minutes + ":" + seconds);
      }
      if (minutes == 0 && seconds == 0) {
        if (initial_timer == 25) {
          alert("Pomodoro complete! Take a 5 min break");
          task_complete();
          clearInterval(progress_timer);
          $('.meter').width('0%');
          timer_start(5);
        } else if (initial_timer == 5) {
          reset();
          $('a.close-reveal-modal').trigger('click');
        }
      }
    }, 1000);
    // Progress_bar
    var prg = 0;
    var prog;
      if (initial_timer == 25) {
        progress_timer = setInterval(function () {
          prg += 0.069;
          prog = prg + '%';
          $('.meter').width(prog);
        }, 1000);
      }
  };

  $('#reset').on('click', function(){
    are_you_sure();
  });

  $(document).foundation().foundation('reveal', {
     closeOnBackgroundClick: false,
     animationSpeed: 1000
  });
  // $('#countdown_container').bind('opened', function() {

  // });
  $('#countdown_container').bind('closed',
    function() {
      clearInterval(progress_timer);
      $('.meter').width('0%');
  });
  
  sortEm = function(a,b) {
  return parseInt($('span.label', a).text()) < parseInt($('.label', b).text()) ? 1 : -1;
  }
  
});

// var modWidth = 50;
// $( "div" ).one( "click", function() {
//   $( this ).width( modWidth ).addClass( "mod" );
//   modWidth -= 8;
// });