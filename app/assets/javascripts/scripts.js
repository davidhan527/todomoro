var testobject = {};

var timer;
var timer_start;

var reset = function() {
  clearInterval(timer);
  countdown.innerHTML = "25:00";
};

$(document).ready(function() {
  var minutes, seconds;
   
  // get tag element
  var countdown = document.getElementById("countdown");

  timer_start = function(minutes) {
    var target_date = new Date(new Date().getTime() + (minutes*60000));
    timer = setInterval(function () {
      // find the amount of "seconds" between now and target
      var current_date = new Date();
      
      var seconds_left = (target_date - current_date.getTime()) / 1000;

      minutes = parseInt(seconds_left / 60);
      seconds = parseInt(seconds_left % 60);

      // format countdown string + set tag value
      
      if (seconds >= 0 && seconds < 10) {
        countdown.innerHTML = minutes + ":" +"0" + seconds;
      } else {
        countdown.innerHTML = minutes + ":" + seconds;
      }
      if (minutes == 0 && seconds == 0) {
        alert("Take a 5 min break!");
        reset();
      }
    }, 1000);

  };
});