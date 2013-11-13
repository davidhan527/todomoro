var testobject = {};
var bb_var = {};
var timer, model_id;
var timer = 0;

var are_you_sure = function() {
  if(confirm("Are you sure?")){
    reset();
  }
  else {

  }
};

var reset = function() {
  clearInterval(timer);
  $('#countdown').html("25:00");
};

var task_complete = function() {
  clearInterval(timer);
  $('#countdown').html("25:00")
  console.log("[  ] =", bb_var.id );
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
    var target_date = new Date(new Date().getTime() + (minutes*60000) + 2000);
    timer = setInterval(function () {
      // find the amount of "seconds" between now and target
      var current_date = new Date();
      
      var seconds_left = (target_date - current_date.getTime()) / 1000;

      minutes = parseInt(seconds_left / 60);
      seconds = parseInt(seconds_left % 60);

      // format countdown string + set tag value
      $countdown = $('#countdown')
      if (seconds >= 0 && seconds < 10) {
        $countdown.html(minutes + ":" +"0" + seconds)
      } else {
        $countdown.html(minutes + ":" + seconds)
      }
      if (minutes == 0 && seconds == 0) {
        alert("Take a 5 min break!");
        task_complete();
      }
    }, 1000);

  };
});