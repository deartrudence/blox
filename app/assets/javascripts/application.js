// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery-1.10.2
//= require jquery_ujs
//= require jquery-ui-1.10.4
//= require isotope
//= require sort
//= require zeroclipboard
//= require_tree .

$(function(){
$(".dropdown-1").hover(            
  function() {
    $('.menu-1', this).fadeIn("fast");
    $(this).toggleClass('open');
    $('b', this).toggleClass("caret caret-up");                
  },
  function() {
    $('.menu-1', this).fadeOut("fast");
    $(this).toggleClass('open');
    $('b', this).toggleClass("caret caret-up");                
  });
});

$(function(){
$(".dropdown-2").hover(            
  function() {
    $('.menu-2', this).fadeIn("fast");
    $(this).toggleClass('open');
    $('b', this).toggleClass("caret caret-up");                
  },
  function() {
    $('.menu-2', this).fadeOut("fast");
    $(this).toggleClass('open');
    $('b', this).toggleClass("caret caret-up");                
  });
});

$(function(){
$(".dropdown-3").hover(            
  function() {
    $('.menu-3', this).fadeIn("fast");
    $(this).toggleClass('open');
    $('b', this).toggleClass("caret caret-up");                
  },
  function() {
    $('.menu-3', this).fadeOut("fast");
    $(this).toggleClass('open');
    $('b', this).toggleClass("caret caret-up");                
  });
});


function updateContainerSize(sizeid, scaleval) {
  var theframe = document.getElementById('iframe-'+sizeid);
  var thecontainer = document.getElementById('show-iframe-'+sizeid);
  thecontainer.style.height = (theframe.scrollHeight * scaleval) + 'px';
  thecontainer.style.width = (1200 * scaleval) + 'px';
  console.log("updateContainerSize");
};

function returnHeaderTag(){
  return '<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">' + 
      '<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">' +
      '<style>body{font:300 18px/30px "Open Sans",arial,sans-serif}p{font-size:16px}h1,h2,h3,h4,h5,h6{color:#272727;font-family:Montserrat,sans-serif;font-weight:400;line-height:1.17em}h1{font-size:3.5em;text-transform:uppercase}h2{font-size:2.4em;text-transform:uppercase}h3{font-size:30px;text-transform:uppercase}h4{font-size:1.8em;text-transform:uppercase}h5{font-size:21px}h6{font-size:16px;line-height:22px}.light-gray-bg{background-color:#f5f5f5}.dark-gray-bg{background-color:#333}.rose-bg{background-color:#C61D38}</style>';
};

function updateIframeSize(blocframe) {
    setIframeHeight(document.getElementById(blocframe));
    $('#'+blocframe).contents().find('a').click(function(event) {
        event.preventDefault();
    });
    console.log("updateIframeSize"); 
};

function setIframeHeight(iframe) {
    if (iframe) {
        var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
        if (iframeWin.document.body) {
            iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
        }
    }
};

function iframeMagic(iframe, container, scaleval) {
  var theframe = document.getElementById(iframe);
  var thecontainer = document.getElementById(container);


  // Prevent Defaults
  $(theframe).contents().find('a').click(function(event) {
    event.preventDefault();
  });

  //Set Iframe Height
  var iframeWin = theframe.contentWindow || theframe.contentDocument.parentWindow;
  if (iframeWin.document.body) {
      theframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
  }
  console.log("Set Iframe Height -> " + theframe.height);

  //Set Container Size
  thecontainer.style.height = (theframe.height * scaleval) + 'px';
  thecontainer.style.width = (1200 * scaleval) + 'px';
  console.log("Set Container Size -> " + thecontainer.style.height);

};

