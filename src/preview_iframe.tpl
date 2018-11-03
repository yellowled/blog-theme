<!DOCTYPE html>
<html class="no-js{if $smarty.cookies.webfonts != ''} fonts-loaded{/if}" lang="{$lang}">
<head>
    <meta charset="{$head_charset}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
    <link rel="stylesheet" href="{$serendipityHTTPPath}{$serendipityRewritePrefix}serendipity.css">
{serendipity_hookPlugin hook="backend_header" hookAll="true"}
<script>window.onload = function() {ldelim}
    parent.document.getElementById('serendipity_iframe').style.height = document.querySelector('html').offsetHeight + 'px';
    parent.document.getElementById('serendipity_iframe').scrolling    = 'no';
    parent.document.getElementById('serendipity_iframe').style.border = 0;
{rdelim}</script>
</head>
<body>
    <main>
{if $mode == 'save'}
        <div style="float: left; height: 75px"></div>
        {$updertHooks}
    {if $res}
        <div class="serendipity_msg_important">{$CONST.ERROR}: <b>{$res}</b></div>
    {else}
        {if $lastSavedEntry}
        <script>$(document).ready(function() {
            parent.document.forms['serendipityEntry']['serendipity[id]'].value = "{$lastSavedEntry}";
        });
        </script>
        {/if}
        <span class="msg_success"><span class="icon-ok-circled"></span> {$CONST.ENTRY_SAVED}</span>
        <a href="{$entrylink}" target="_blank">{$CONST.VIEW}</a>
    {/if}
{/if}
    {$preview}
    </main>

    <script src="{serendipity_getFile file="scripts/master.js" frontend=true}?v={$theme_version}"></script>
</body>
</html>
