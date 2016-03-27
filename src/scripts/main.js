(function($) {
    // SVG polyfill
    svg4everybody();

    // Search show/hide
    $('#toggle-search').click(function() {
        var $el = $(this);
        var $toggled = '#' + $el.attr('aria-controls');
        var $target = $($toggled).find('input[type="search"]');

        if ($el.attr('aria-expanded') == 'false') {
            $el.attr('aria-expanded', 'true');
            $($toggled).attr('aria-hidden', 'false');
            $($target).focus();
        } else {
            $el.attr('aria-expanded', 'false');
            $($toggled).attr('aria-hidden', 'true');
            $($target).blur();
        }
    });

    // Deep anchor links for headings
    anchors.options = {
        placement: 'left',
        visible: 'touch',
        icon: '#'
    };

    anchors.add('.post h3, .post h4, .post h5, post h6, .page h3, .page h4, .page h5, page h6, .archive-overview h3, .archive-overview h4');
    anchors.remove('.comment header > h4');

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
