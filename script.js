$(document).ready(function() {
  $(".menuitem").on("click", function(event) {
    $("h1").fadeTo(300,0.1);
    $("h1").animate({'margin-top': '-1.4em', 'text-align': 'center'}, 300);
    $(".selected").not(this).each(function() {
      $(this).removeClass("selected").addClass("menuitem");
    });
    $(this).removeClass("menuitem").addClass("selected");
    event.preventDefault();
  });
  $("#cv").on("click", function(e) {
    $("#iframe").fadeOut(100);
    setTimeout(function() {
      $("#iframe").load("resume/resume.html", function() {
        $("#iframe").fadeIn(100);
      });
    }, 200);
  });
  $("#music").on("click", function(e) {
    $("#iframe").fadeOut(100);
    setTimeout(function() {
      $("#iframe").load("music/index.html", function() {
        $("#iframe").fadeIn(100);
      });
    }, 100);
  });
  $("#contact").on("click", function(e) {
    $("#iframe").fadeOut(100);
    setTimeout(function() {
      $("#iframe").load("contact.html", function() {
        $("#iframe").fadeIn(100);
      });
    }, 100);
  });
});
