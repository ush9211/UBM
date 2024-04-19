$(function(){
	
	// 수강신청 탭메뉴
	$('.tabnav>li').click(function(e){
        e.preventDefault();

        $('.tabnav>li').removeClass('active');

        const href = $(this).find('a').attr('href');

        $(this).addClass('active');

        $('.tab').removeClass('active');

        $(href).addClass('active');
    });
    
    
    
});