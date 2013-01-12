$(document).ready(function(){

  
// http://www.alistapart.com/articles/expanding-text-areas-made-elegant/
function makeExpandingArea(container) {
  var $area = $(container).find('textarea');
  var $span = $(container).find('span');
  $area.on('input', function() {
    $span.html($area.val());
  });
  $span.html($area.val());
  $(container).addClass('active');
}
  

defaultHeight = 100;
// function makeExpandingArea(container) {
//  var area = container.querySelector('textarea');
//  var span = container.querySelector('span');
//  if (area.addEventListener) {
//    area.addEventListener('input', function() {
//      span.textContent = area.value;
//    }, false);
//    span.textContent = area.value;
//  } else if (area.attachEvent) {
//    // IE8 compatibility
//    area.attachEvent('onpropertychange', function() {
//      span.innerText = area.value;
//    });
//    span.innerText = area.value;
//  }
//  // Enable extra CSS
//  container.className += ' active';
// }

$('.expanding-area').each(function(i) {
  console.log("run");
  makeExpandingArea(this);
});

// var areas = $('.expanding-area');
// var l = areas.length;
// 
// while (l--) {
//  makeExpandingArea(areas[l]);
// }
// 
// $("body").on('input propertychange', '.js-textarea', function(){
// Make a hidden div that has the same css attributes as the textarea
  
  // $(this).height(function(index, height){
  //   if (height != $(this).prop('scrollHeight')){
  //     var paddingTop = parseInt($(this).css("padding-top"), 10);
  //     var paddingBottom = parseInt($(this).css("padding-bottom"), 10);
  //     var newHeight = $(this).prop('scrollHeight') - paddingTop - paddingBottom;
  //     if (newHeight < defaultHeight){
  //       return defaultHeight;
  //     }
  //     else {
  //       return newHeight;
  //     }
  //   }
  //   else {
  //     return height;
  //   }
  // });
// });

});
