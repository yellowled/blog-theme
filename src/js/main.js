(function ($) {
    // Obviously, we have JS
    $('html').addClass('js').removeClass('no-js');

    // SVG polyfill
    svg4everybody();

    // If webfonts cookie is NOT set
    if (!cookie('webfonts')) {
        // Generate a font face observer
        const font = new FontFaceObserver('calendas_plus');

        font.load(null, 5000).then(function () {
            // Add webfonts class to html element
            document.documentElement.className += " fonts-loaded";
            // Set webfonts cookie
            cookie('webfonts', '1', 7);
        });
    }

    // Off-canvas nav
    const myOffcanvas = Froffcanvas({
        selector: '.offcanvas',
        openSelector: '.open-nav',
        closeSelector: '.close-nav',
        readyClass: 'offcanvas-ready',
        activeClass: 'offcanvas-active'
    });

    // Smooth scrolling links in comments
    $('.comment_reply').click(function (e) {
        const $el = $(this);
        let target, replyTo;

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
