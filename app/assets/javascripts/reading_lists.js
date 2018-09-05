//$(document).ready(function () {
    $("button").on("click", function(event) {
        event.preventDefault();

        var $button = $(this);
        var url = $button.data("url");

        //ajax call for loading create reading list partial
        $.get(url, function(response) {


          //parse string response (form header and actual form) into an array of DOM nodes
          var html = $.parseHTML(response)
          $button.after(html);

          //isolate and render form
          var form = html[2];
          //hijack form submit event
          $(form).submit(function(event) {
            event.preventDefault();

            var values = $(this).serialize();
            //create new list
            var posting = $.post(this.action, values);
            //append new list onto the dom
            posting.done(function(data) {
              let newReadingList = new ReadingList(data);
              let listName = newReadingList.displayNewList();
              let insertnewList = "<li><a href=" + `${this.url}/` + data["id"] + ">" + listName + "</a></li>";
              let getLists = $(".reading_lists");
              getLists.append(insertnewList);
              $(html).html(""); //clear new reading list form
            })
          })
        })
    })
  //}
//);

function ReadingList(data) {
  this.id = data.id
  this.name = data.name
  this.user = data.user
}

ReadingList.prototype.displayNewList = function() {
  let listName = this.name;
  return listName
}
