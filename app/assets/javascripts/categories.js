$(".js-more").on("click", function(event) {
  alert("Stop right there!");
  event.preventDefault();
  var categoryId = this.dataset.categoryId;
  var subcategoryId = this.dataset.subcategoryId;
  $.get("/categories/" + categoryId + "/subcategories/" + subcategoryId + ".json", function(data) {
      console.log(data);
      var articles = data["articles"]; //returns an array of article objects, add in links to article serializer?
      var newArticleList = "<ul>"
      for (var i = 0; i < articles.length; i++) {
        newArticleList += "<li>" + articles[i]["name"] + "</li>"
      };
      newArticleList += "</ul>"
      $("#subcategory-" + subcategoryId).html(newArticleList);
      });
  });
