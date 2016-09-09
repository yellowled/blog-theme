<!DOCTYPE html>
<html id="preview_iframe" class="no-js" lang="{$lang}">
<head>
    <meta charset="{$head_charset}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
    <link rel="stylesheet" href="{$serendipityHTTPPath}{$serendipityRewritePrefix}serendipity.css">
    <script src="{serendipity_getFile file="scripts/modernizr/modernizr.js" frontend=true}"></script>
{serendipity_hookPlugin hook="backend_header" hookAll="true"}
    <script src="{serendipity_getFile file='admin/js/plugins.js'}"></script>
    <script src="{serendipity_getFile file='admin/serendipity_editor.js'}"></script>
<script>window.onload = function() {ldelim}
    parent.document.getElementById('serendipity_iframe').style.height = document.getElementById('preview_iframe').offsetHeight + 'px';
    parent.document.getElementById('serendipity_iframe').scrolling    = 'no';
    parent.document.getElementById('serendipity_iframe').style.border = 0;
{rdelim}</script>
</head>
<body>
    <main>
    {$preview}
    </main>

    <script src="{serendipity_getFile file="scripts/master.js" frontend=true}"></script>
</body>
</html>
