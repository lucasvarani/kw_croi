$('#slides').cycle({
	timeout : 5000,
	fx: 'fade',
	pager: '#nav-pages',     
	  // callback fn that creates a thumbnail to use as pager anchor 
	  pagerAnchorBuilder: function(idx, slide) { 
	                  return '<a href="#"></a>'; //what you want ti return like '<li></li>'
	  } 
}); 
	
$("#CleanSearch").click(function(){
    $("#input_search").val(""); 
    $("#form-send_search").submit();  
});

$(".fancybox").fancybox({
	maxWidth	: 3000,
	maxHeight	: 3000,
	fitToView	: false,
	width		: '100%',
	height		: '100%',
	margin	: 0,
	padding	: 0,
	closeBtn	: false,
  helpers   : { 
  	overlay : {closeClick: false} // prevents closing when clicking OUTSIDE fancybox 
  }
});

$(".servicos-fancybox").fancybox({
    maxWidth    : 950,
	fitToView	: false,
	width		: '70%',
	height		: '70%',
	margin	: 0,
	padding	: 0,
	closeBtn	: true,
  helpers   : { 
  	overlay : {closeClick: false} // prevents closing when clicking OUTSIDE fancybox 
  }
});
