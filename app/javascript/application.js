// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

//= require jquery

import "@hotwired/turbo-rails"

$(".post").click(function(){
   // var url_value = window.location.href
   // console.log(url_value)
   $.ajax({
      type: "POST",
      // url: "topics/"+@topic.id+"/posts/"+@post.id+"/readstatus",
      // data: {topic_id:1,post_id:1},
      success: function(resp){
         alert("Data");
      }
      // dataType: dataType
   })
});

   $(".open").click(function() {
   alert("oi")
})

console.log("Hai")