$(window).on('load', function(){
  var text_wrap = '.fadein_text'; //pタグのクラス
  var delay_speed = 60; //文字が出るスピード(ミリ秒)
  var fade_speed = 700; //文字がフェードするスピード(ミリ秒)
  var str;
  $(text_wrap).css('opacity','0.9');
  var firsttxt = $(text_wrap).html();
  str = firsttxt.replace(/<br>/g,'\n');
  $(text_wrap).html('');
  for (var i = 0; i < str.length; i++) {
      $(text_wrap).append('<span class="text_span">'+str.substr(i, 1).replace(/\n/, "<br>")+'</span>');
      $(text_wrap).children('span:last-child').delay(delay_speed * i).animate({opacity:'1'}, fade_speed);
  }
  setTimeout(function(){$(text_wrap).html(firsttxt)},str.length*delay_speed+fade_speed);
});
