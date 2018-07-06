$(".js-more").on("click", function() {
  var categoryId = this.dataset.categoryId;
  var subcategoryId = this.dataset.subcategoryId;
  $.get("/categories/" + categoryId + "/subcategories/" + subcategoryId + ".json", function(data) {
      debugger
        console.log(data);
        var articles = data; //returns an array
      });
  });
