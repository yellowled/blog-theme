{if $is_embedded != true}
<!DOCTYPE html>
<html class="no-js" lang="{$lang}">
<head>
    <meta charset="{$head_charset}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$head_title|default:$blogTitle}{if $head_subtitle} | {$head_subtitle}{/if}</title>
    <meta name="generator" content="Serendipity v.{$head_version}">
    <link rel="stylesheet" href="{$head_link_stylesheet}">
    <script src="{serendipity_getFile file="scripts/modernizr/modernizr.js"}"></script>
    <link rel="alternate" type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate" type="application/x.atom+xml" title="{$blogTitle} Atom feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml">
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
{/if}
{serendipity_hookPlugin hook="frontend_header"}
</head>
<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}
    <header>
        <h1><a href="{$serendipityBaseURL}">{$blogTitle}</a></h1>
        <span>{$blogDescription}</span>
    </header>

    <main>
    {$CONTENT}
    </main>

    <aside>
    {if $leftSidebarElements > 0}{serendipity_printSidebar side="left"}{/if}
    {if $rightSidebarElements > 0}{serendipity_printSidebar side="right"}{/if}
    </aside>

    <footer>
        <span class="sys" lang="en">Powered by <a href="http://s9y.org">Serendipity</a></span>
        <span class="tpl" lang="en">Template</span> by <a href="http://netzgestaltung.net">Matthias Mees</a></span>
    </footer>

    <script src="{serendipity_getFile file="scripts/master.js"}"></script>
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
