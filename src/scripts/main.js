(function($) {
    // Smallscreen nav
    var nav = responsiveNav('.nav-collapse', {
        customToggle: "#show-nav",
        closeOnNavClick: true,
    });

    // SVG polyfill
    svg4everybody();
})(jQuery);
