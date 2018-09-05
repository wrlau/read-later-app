$(".js-more").on("click", function(event) {
  event.preventDefault();
  var categoryId = this.dataset.categoryId;
  var subcategoryId = this.dataset.subcategoryId;
  $.get("/categories/" + categoryId + "/subcategories/" + subcategoryId + ".json", function(data) {
      console.log(data);
      var articles = data["articles"]; //returns an array of article objects
      var newArticleList = "<ul>"
      for (var i = 0; i < articles.length; i++) {
        newArticleList += "<li><a href="+ '/articles/' + articles[i]["id"]+ ">"+ articles[i]["name"] + "</a></li>"
      };
      newArticleList += "</ul>"
      $("#subcategory-" + subcategoryId).html(newArticleList);
      });
  });

  $("button").on("click", function(event) {
    var $button = $(this);
    var url = $button.data("url");

    $.get(url, function(data) {
      console.log(data);
      debugger
      var newCategoryList = "<h3>Categories</h3><ul>"
      for (var i = 0; i < data.length; i++) {
        newCategoryList += "<li><a href="+ '/categories/' + data[i]["id"]+ ">"+ data[i]["name"] + "</a></li>"
      };
      newCategoryList += "</ul>"
      $("button").after(newCategoryList);
    });
  });
