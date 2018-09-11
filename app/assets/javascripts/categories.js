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

  $("#start").on("click", function() {
    var $button = $(this);
    var url = $button.data("url");

    $.get(url, function(data) {
      var newCategoryList = "<h3>Categories</h3><ul>"
      for (var i = 0; i < data.length; i++) {
        newCategoryList += "<li><a href="+ '/categories/' + data[i]["id"]+ ">"+ data[i]["name"] + "</a></li>"
      };
      newCategoryList += "</ul>"
      $("#categoriesList").html(newCategoryList);
    }, "json");
  });

  $("#alphabetize").on("click", function() {
    var $alphabetize = $(this);
    var url = $alphabetize.data("url");

    $.get(url, function(data) { //returns array of category objects
      //sort category objects in alphabetical order
      var alphabetized = data.sort(function(a,b) {
        var nameA = a.name.toUpperCase();
        var nameB = b.name.toUpperCase();
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
        return 0;
      });
      //iterate through categories objects, create links, and add to DOM
      var newCategoryList = "<h3>Categories</h3><ul>"
      for (var i = 0; i < alphabetized.length; i++) {
        newCategoryList += "<li><a href="+ '/categories/' + alphabetized[i]["id"]+ ">"+ alphabetized[i]["name"] + "</a></li>"
      };
      newCategoryList += "</ul>"
      $("#categoriesList").html(newCategoryList);
    }, "json");
  });
