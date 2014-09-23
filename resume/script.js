$(document).ready(function() {
  $(".moreinfo").on("click", function(event) {
    $(this).find(".info").slideToggle();
    $(this).find(".infop").slideToggle();
    event.preventDefault();
    event.stopPropagation();
  });
  $(".link").on("click", function(event) {
    event.stopPropagation();
  });
  $(".degree").on("click", function(event) {
    $(this).find(".courses").slideToggle();
    event.preventDefault();
    event.stopPropagation();
  });
});
