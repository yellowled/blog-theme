(function($) {
    // SVG polyfill
    svg4everybody();

    // Collapsible search form
    $('#show_search').click(function(e) {
        e.preventDefault();
        var $target = $(this.hash);

        if ($target.hasClass('visuallyhidden')) {
            $target.removeClass('visuallyhidden')
            $('#searchterm').focus();
        } else {
            $target.addClass('visuallyhidden')
            $('#searchterm').blur();
        }
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
