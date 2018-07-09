$(".js-next").on("click", function(event) {
  event.preventDefault();
  var nextId = parseInt(this.dataset.id) + 1;
  $.get("/articles/" + nextId + ".json", function(data) {
    $(".articleName").html(data["name"]);
    $(".articleUrl").attr("href", data["url"]);
    $(".js-next").attr("data-id", data["id"]);
  });
});
