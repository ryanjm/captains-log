$("document").ready(function(){
  if ($("#js-log-body") !== 0){
    console.log("Setting up converter");
    var converter = new Showdown.converter(); 
    $("#js-log-body").bind("input paste",function(){
      $("#js-preview").html(converter.makeHtml($(this).val()));
    });
    $("#js-preview").html(converter.makeHtml($("#js-log-body").val()));
  }
});
