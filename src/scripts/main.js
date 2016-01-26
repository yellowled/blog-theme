(function($) {
    // SVG polyfill
    svg4everybody();

    // Collapsible search form
    $('#search').collapse({
        open: function() {
            this.slideDown(250);
            $('#searchterm').focus();
        },
        close: function() {
            this.slideUp(250);
            $('#searchterm').blur();
        }
    });

    $('.show_search').click(function(e) {
        e.preventDefault();
        $(this.hash).trigger("toggle");
    });
})(jQuery);
