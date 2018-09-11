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
