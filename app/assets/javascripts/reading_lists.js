$("button").on("click", function(event) {
    event.preventDefault();
    alert("You clicked!!");

    var $button = $(this);
    var url = $button.data("url");

    //ajax call for loading create reading list partial
    $.get(url, function(response) {
      alert("you got the form!");

      //parse string response (form header and actual form) into an array of DOM nodes
      var html = $.parseHTML(response)
      $button.after(html);

      //isolate and render form
      var form = html[2];
      //hijack form submit event
      $(form).submit(function(event) {
        alert("you submitted the form!");
        event.preventDefault();

        var values = $(this).serialize();
        //create new list
        var posting = $.post(this.action, values);
        //append new list onto the dom
        posting.done(function(data) {
          let newList = "<li><a href=" + `${this.url}/` + data["id"] + ">" + data["name"] + "</a></li>";
          let getLists = $(".reading_lists");
          getLists.append(newList);
          $(html).html(""); //clear new reading list form
        })
      })
    })
})
