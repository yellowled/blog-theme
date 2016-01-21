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
        <p class="live-redesign"><b>Hinweis:</b> Dieses Blog sieht derzeit etwas seltsam aus. Aber nicht, weil es kaputt ist, sondern weil es <a href="http://yellowled.de/archiv/69/LR16-Die-Spielregeln.html">live redesigned</a> wird.</p>

        <h1><a href="{$serendipityBaseURL}">{$blogTitle}</a></h1>
    {if $blogDescription}
        <p>{$blogDescription}</p>
    {/if}
    </header>
    {if $template_option.use_corenav}
    <nav class="navbar">
        <a id="open-nav" class="nav-toggle" href="#site-nav"><span class="icon-menu" aria-hidden="true"></span><span class="fallback-text">Navigation</span></a>

        <div id="site-nav" class="nav-collapse">
            <ul>{foreach from=$navlinks item="navlink" name="sbnav"}{if $navlink.title!=""&&$navlink.href!=""}<li>{if $currpage==$navlink.href or $currpage2==$navlink.href}<span>{else}<a href="{$navlink.href}">{/if}{$navlink.title}{if $currpage==$navlink.href or $currpage2==$navlink.href}</span>{else}</a>{/if}</li>{/if}{/foreach}</ul>
        </div>
    </nav>
    {/if}
    <form id="search" action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
        <input type="hidden" name="serendipity[action]" value="search">

        <label for="searchterm">{$CONST.QUICKSEARCH}</label>
        <input id="searchterm" type="search" name="serendipity[searchTerm]" value="">
        <input type="submit" name="serendipity[searchButton]"  value="{$CONST.GO}">
    </form>
    {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}

    <main>
    {if $view == '404'}
        <article class="post post-404">
            <header>
                <h2>{$CONST.BT_404_HEAD}</h2>
            </header>

            <div class="content clearfix">
                <p>{$CONST.BT_404_TEXT}</p>
            </div>
        </article>
    {else}
        {$CONTENT}
    {/if}
    </main>

    <aside>
    {if $leftSidebarElements > 0}{serendipity_printSidebar side="left"}{/if}
    {if $rightSidebarElements > 0}{serendipity_printSidebar side="right"}{/if}
    </aside>

    <footer>
        <ul id="credits">
            <li><small lang="en">Powered by <a href="http://s9y.org">Serendipity</a></small></li>
            <li><small lang="en">Template by <a href="http://netzgestaltung.net">Matthias Mees</a></small></li>
        </ul>
    </footer>

    <script src="{serendipity_getFile file="scripts/master.js"}"></script>
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
