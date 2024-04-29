$(function(){

	//Attendance 검색
   $('.dropdown-menu>a.dropdown-item').click(function(e){
      e.preventDefault();
      let $val = $(this).attr("href");
      let $txt = $(this).text();
      $('.dropdown-toggle').text($txt);
      $('.dropdown-toggle').val($val);
      $('#searchname').val($val);
   });
	
	// 수강신청 탭메뉴
	$('.tabnav>li').click(function(e){
        e.preventDefault();

        $('.tabnav>li').removeClass('active');

        const href = $(this).find('a').attr('href');

        $(this).addClass('active');

        $('.tab').removeClass('active');

        $(href).addClass('active');
    });
    
    $(".b-student").click(function () {
       $("form").attr("action", "login.jsp");
     });
 
     $(".b-professor").click(function () {
       $("form").attr("action", "login.jsp");
      });  
    
  }); //jquery
     