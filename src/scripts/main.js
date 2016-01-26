(function($) {
    // SVG polyfill
    svg4everybody();

    // Collapsible search form
    $('#show_search').click(function(e) {
        e.preventDefault();
        $(this.hash).trigger("toggle");
    });
    $('#search').bind('opened', function() {
        $('#searchterm').focus();
    });
    $('#search').bind('closed', function() {
        $('#searchterm').blur();
    });
})(jQuery);
