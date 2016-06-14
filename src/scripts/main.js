(function($) {
    // SVG polyfill
    svg4everybody();

    // Off-canvas nav
    var myOffcanvas = Froffcanvas({
        selector: '.offcanvas',
        openSelector: '.open-nav',
        closeSelector: '.close-nav',
        readyClass: 'offcanvas-ready',
        activeClass: 'offcanvas-active'
    });

    // Smooth scrolling links in comments
    $('.comment_reply').click(function(e) {
        var $el = $(this);
        var target, replyTo;

        target = '#reply';
        replyTo = $el.attr("id").replace(/serendipity_reply_/g, "");
        $("#serendipity_replyTo").val(replyTo);

        $('html, body').animate({
            scrollTop: $(target).offset().top
        }, 250);

        e.preventDefault();
    });

    // Move comment preview
    $('#c').insertAfter('#feedback');
})(jQuery);
