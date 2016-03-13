(function($) {
    // SVG polyfill
    svg4everybody();

    // Deep anchor links for headings
    anchors.options = {
        placement: 'right',
        visible: 'touch',
        icon: '#'
    }
    anchors.add('.post h3, .post h4, .post h5, post h6, .page h3, .page h4, .page h5, page h6, .archive-overview h3, .archive-overview h4');
    anchors.remove('.comment header > h4');

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
