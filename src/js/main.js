(function($) {
    // Obviously, we have JS
    $('html')
        .addClass('js')
        .removeClass('no-js');

    /* eslint-disable no-undef */
    // If webfonts cookie is NOT set
    if (!cookie('webfonts')) {
        // Generate a font face observer
        const font = new FontFaceObserver('calendas_plus');

        font.load(null, 5000).then(function() {
            // Add webfonts class to html element
            document.documentElement.className += ' fonts-loaded';
            // Set webfonts cookie
            cookie('webfonts', '1', 7);
        });
    }
    /* eslint-enable no-undef */

    // Navigation toggle
    const navContainer = $('#site-nav');
    const navOpen = $('#open-nav');
    const navClose = $('#close-nav');

    navOpen.click(function() {
        navContainer.attr('aria-hidden', 'false');
        navOpen.attr('aria-expanded', 'true');
        navClose.attr('aria-expanded', 'true');
    });

    navClose.click(function() {
        navContainer.attr('aria-hidden', 'true');
        navOpen.attr('aria-expanded', 'false');
        navClose.attr('aria-expanded', 'false');
    });

    // Smooth scrolling links in comments
    $('.comment_reply').click(function(e) {
        const $el = $(this);
        let target, replyTo;

        target = '#reply';
        replyTo = $el.attr('id').replace(/serendipity_reply_/g, '');
        $('#serendipity_replyTo').val(replyTo);

        $('html, body').animate({ scrollTop: $(target).offset().top }, 250);

        e.preventDefault();
    });

    // Move comment preview
    $('#c').insertAfter('#feedback');
})(jQuery);
