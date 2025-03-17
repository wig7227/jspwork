$(() => { 
    // nav 전체가 내려오게 하기
    $('.nav').mouseover(function() {
        $('.submenu').stop().slideDown();
    });
    $('.nav').mouseout(function() {
        $('.submenu').stop().slideUp();
    });

    setInterval(fadeIn, 1000);

    // x= [img1, img2, img3]
    let x = $('#imgslide>img');
    let y = 3;
    function fadeIn() {
        y--;
        if(y==0) {
            x.fadeIn(1500);
            y=3;
        } else {
            x.eq(y).fadeOut(1500);
        }    
    }
})