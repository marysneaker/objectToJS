/**
 *
 * @authors leexm (you@example.org)
 * @date    2016-03-24 14:45:01
 * @version $0.3$
 */
$(function () {
	$('section .container').hide();
	$('section .container').eq(0).show();
	// 侧边栏事件
	$('.menu li').bind('touchstart', function () {
		$(this).siblings().removeClass('active');
		$(this).addClass('active');
		$('section .container').hide();
		$('section .container').eq($(this).data('tar')).show();
	})
	$('#mode').change(function(){
		// $(this).css("background-color","#FFFFCC");
		console.log($(this).find('option:selected').attr('value'));
		if($(this).find('option:selected').attr('value') == 0){
			$('#scan').addClass('disabled');
		}else {
			$('#scan').removeClass('disabled');
		}
	});
	//var API = testobject;

	var i = new Swr_API();
})

var Swr_API = function () {
    
    this.JSMethod = function (string) {
        alert(string);
    };
    
};



// 同步设备事件
function sync() {
    alert('hh');
    testobject.SetDataLoggerTime();
    alert('jjj');

}

