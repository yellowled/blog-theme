{if $is_embedded != true}
<!DOCTYPE html>
<html class="no-js{if $smarty.cookies.webfonts != ''} fonts-loaded{/if}" lang="{$lang}">
<head>
    <meta charset="{$head_charset}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$head_title|default:$blogTitle}{if $head_subtitle} | {$head_subtitle}{/if}</title>
    <meta name="generator" content="Serendipity v.{$head_version}">
{if ($view == "entry" || $view == "start" || $view == "feed" || $view == "plugin" || $staticpage_pagetitle != "" || $robots_index == 'index')}
    <meta name="robots" content="index,follow">
{else}
    <meta name="robots" content="noindex,follow">
{/if}
{if ($view == "entry")}
    <link rel="canonical" href="{$entry.rdf_ident}">
{/if}
{if ($view == "start")}
    <link rel="canonical" href="{$serendipityBaseURL}">
{/if}
{if $template_option.siteverification}
    <meta name="google-site-verification" content="{$template_option.siteverification}">
{/if}
    <link rel="stylesheet" href="{$head_link_stylesheet}">
{if $template_option.adaptive_images}
    <script>document.cookie='resolution='+Math.max(screen.width,screen.height)+("devicePixelRatio" in window ? ","+devicePixelRatio : ",1")+'; path=/';</script>
{/if}
    <script src="{serendipity_getFile file="scripts/modernizr/modernizr.js"}?v={$theme_version}"></script>
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
    <header role="banner">
        <div class="masthead">
            <a href="{$serendipityBaseURL}">{$template_option.identity}</a>

            <button class="open-nav" type="button" aria-controls="site-nav" aria-label="{$CONST.BT_NAV_OPEN}"><svg class="icon-bars" viewbox="0 0 1792 1792" width="1792" height="1792" aria-hidden="true"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#bars"></use></svg></button>
        </div>
    </header>

    <nav id="site-nav" class="offcanvas" role="navigation">
        <form id="search" role="search" action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
            <input type="hidden" name="serendipity[action]" value="search">

            <div id="search_inputs">
                <label for="searchterm">{$CONST.QUICKSEARCH}</label>
                <input id="searchterm" type="search" name="serendipity[searchTerm]" value="">
                <input class="visuallyhidden" type="submit" name="serendipity[searchButton]" value="{$CONST.GO}">
            </div>
        </form>
        {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
    {if $template_option.use_corenav}
        <ul>
        {foreach from=$navlinks item="navlink" name="sbnav"}
        {if $navlink.title!=""&&$navlink.href!=""}
            <li>{if $currpage==$navlink.href or $currpage2==$navlink.href}<span>{else}<a href="{$navlink.href}">{/if}{$navlink.title}{if $currpage==$navlink.href or $currpage2==$navlink.href}</span>{else}</a>{/if}</li>
        {/if}
        {/foreach}
        </ul>
    {/if}
        <button class="close-nav" type="button" aria-label="{$CONST.BT_NAV_CLOSE}"><svg class="icon-times" role="img" viewbox="0 0 1792 1792" width="1792" height="1792" aria-hidden="true"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#times"></use></svg></button>
    </nav>

    <main role="main">
    {if $view == "start" && $staticpage_pagetitle == ''}
        {if $template_option.home_greeter_txt}
        <section class="post post-greeter">
            <h2>{$template_option.home_greeter_title}</h2>

            <div class="content clearfix">
                {$template_option.home_greeter_txt}
            </div>
        </section>
        {/if}
        <section class="archive archive-summary archive-index">
            <h2>{$template_option.home_title}</h2>

            <ol>
            {serendipity_fetchPrintEntries full=true fetchDrafts=false noSticky=true limit="0,5" template="teaser.tpl"}
            </ol>
        </section>
    {elseif $view == '404'}
        <article class="post post-404">
            <h2>{$CONST.BT_404_HEAD}</h2>

            <div class="content clearfix">
                <p>{$CONST.BT_404_TEXT}</p>
            </div>
        </article>
    {else}
        {$CONTENT}
    {/if}
    </main>

    <aside id="site-info" role="complementary">
        <div class="sidebar clearfix">
            <section id="info" class="widget">
                <h3>{$template_option.infobox_title}</h3>

                <div class="content">
                    <img id="info-img" src="{$template_option.infobox_img}" alt="">

                    <p>{$template_option.infobox_txt} &mdash; <a href="{$template_option.infobox_more_url}">{$template_option.infobox_more_txt}</a></p>
                </div>
            </section>

            <section id="social" class="widget">
                <h3>{$CONST.BT_SOCIALLINKS}</h3>

                <ul>
                    <li><a class="link-rss" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" aria-label="RSS"><svg class="icon-rss" viewbox="0 0 14 14" width="14" height="14" aria-hidden="true"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#rss"></use></svg></a></li>
                {if $template_option.twitter_url}
                    <li><a class="link-twitter" href="{$template_option.twitter_url}" aria-label="Twitter"><svg class="icon-twitter" viewbox="0 0 19 16" width="19" height="16" aria-hidden="true"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#twitter"></use></svg></a></li>
                {/if}
                {if $template_option.facebook_url}
                    <li><a class="link-facebook" href="{$template_option.facebook_url}" aria-label="Facebook"><svg class="icon-facebook" viewbox="0 0 9 19" width="9" height="19" aria-hidden="true"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#facebook"></use></svg></a></li>
                {/if}
                {if $template_option.instagram_url}
                    <li><a class="link-instagram" href="{$template_option.instagram_url}" aria-label="Instagram"><svg class="icon-instagram" viewbox="0 0 15 16" width="15" height="16" aria-hidden="true"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#instagram"></use></svg></a></li>
                {/if}
                {if $template_option.github_url}
                    <li><a class="link-github" href="{$template_option.github_url}" aria-label="GitHub"><svg class="icon-github" viewbox="0 0 21 17" width="21" height="17" aria-hidden="true"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#github"></use></svg></a></li>
                {/if}
                {if $template_option.xing_url}
                    <li><a class="link-xing" href="{$template_option.xing_url}" aria-label="Xing"><svg class="icon-xing" viewbox="0 0 15 16" width="15" height="16" aria-hidden="true"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#xing"></use></svg></a></li>
                {/if}
                {if $template_option.pinboard_url}
                    <li><a class="link-pinboard" href="{$template_option.pinboard_url}" aria-label="Pinboard"><svg class="icon-pinboard" viewbox="0 0 17 18" width="17" height="18" aria-hidden="true"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#pinboard"></use></svg></a></li>
                {/if}
                {if $template_option.lastfm_url}
                    <li><a class="link-lastfm" href="{$template_option.lastfm_url}" aria-label="Last.fm"><svg class="icon-lastfm" viewbox="0 0 19 11" width="19" height="11" aria-hidden="true"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#lastfm"></use></svg></a></li>
                {/if}
                {if $template_option.amazon_url}
                    <li><a class="link-amazon" href="{$template_option.amazon_url}" aria-label="Amazon"><svg class="icon-amazon" viewbox="0 0 19 18" width="19" height="18" aria-hidden="true"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#amazon"></use></svg></a></li>
                {/if}
                </ul>
            </section>
        </div>
    </aside>
    {if $leftSidebarElements > 0 || $rightSidebarElements > 0}
    <aside id="sidebar" role="complementary">
        <div class="sidebar clearfix">
        {if $leftSidebarElements > 0}
            {serendipity_printSidebar side="left"}
        {/if}
        {if $rightSidebarElements > 0}
            {serendipity_printSidebar side="right"}
        {/if}
        </div>
    </aside>
    {/if}
    {if $template_option.privacy_url || $template_option.legal_url}
    <footer role="contentinfo">
        <nav role="navigation">
            <ul>
            {if $template_option.privacy_url}
                <li><a href="{$template_option.privacy_url}">{$template_option.privacy_txt}</a></li>
            {/if}
            {if $template_option.legal_url}
                <li><a href="{$template_option.legal_url}">{$template_option.legal_txt}</a></li>
            {/if}
            </ul>
        </nav>
    </footer>
    {/if}

    <script src="{serendipity_getFile file="scripts/master.js"}?v={$theme_version}"></script>
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}