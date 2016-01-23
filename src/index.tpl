{if $is_embedded != true}
<!DOCTYPE html>
<html class="no-js" lang="{$lang}">
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
    <header id="site-head">
        <div id="live-redesign">
            <p><b>Hinweis:</b> Dieses Blog sieht derzeit etwas seltsam aus. Aber nicht, weil es kaputt ist, sondern weil es <a href="http://yellowled.de/archiv/69/LR16-Die-Spielregeln.html">live redesigned</a> wird.</p>
        </div>

        <div id="identity">
            <h1><a href="{$serendipityBaseURL}">{$blogTitle}</a></h1>
        {if $blogDescription}
            <p>{$blogDescription}</p>
        {/if}
        </div>

        <nav id="quick-nav">
            <ul>
            {if $template_option.use_corenav}
                <li><a id="show-nav" class="nav-toggle" href="#site-nav"><svg class="icon-bars" role="img" title="Navigation" viewbox="0 0 2048 2048" width="2048" height="2048"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#bars"></use></svg><span class="svg-fallback">Navigation</span></a></li>
            {/if}
                <li><a id="show-search" href="#search"><svg class="icon-search" role="img" title="{$CONST.QUICKSEARCH}" viewbox="0 0 2048 2048" width="2048" height="2048"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#search"></use></svg><span class="svg-fallback">{$CONST.QUICKSEARCH}</span></a></li>
                <li><a id="show-feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2"><svg class="icon-rss" role="img" title="RSS" viewbox="0 0 2048 2048" width="2048" height="2048"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#rss"></use></svg><span class="svg-fallback">RSS</span></a></li>
            </ul>
        </nav>
        {if $template_option.use_corenav}
        <nav class="navbar">
            <div id="site-nav" class="nav-collapse">
                <ul>{foreach from=$navlinks item="navlink" name="sbnav"}{if $navlink.title!=""&&$navlink.href!=""}<li>{if $currpage==$navlink.href or $currpage2==$navlink.href}<span>{else}<a href="{$navlink.href}">{/if}{$navlink.title}{if $currpage==$navlink.href or $currpage2==$navlink.href}</span>{else}</a>{/if}</li>{/if}{/foreach}</ul>
            </div>
        </nav>
        {/if}
    </header>

    <div id="page">
        <main id="main-content">
        {if $view == '404'}
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

        <aside id="sidebar">
            <section id="about" class="widget">
                <h3>{$template_option.infobox_title}</h3>

                <div class="content">
                    <img src="{$template_option.infobox_img}" alt="">

                    {$template_option.infobox_txt}

                    <a href="{$template_option.infobox_more_url}">{$template_option.infobox_more_txt}</a>
                </div>
            </section>
        {if $template_option.twitter_url || $template_option.facebook_url || $template_option.instagram_url || $template_option.github_url || $template_option.dribbble_url || $template_option.xing_url || $template_option.pinboard_url || $template_option.lastfm_url || $template_option.amazon_url}
            <section id="social-media" class="widget">
                <h3>{$CONST.BT_SOCIALLINKS}</h3>

                <ul>
                {if $template_option.twitter_url}
                    <li><a href="{$template_option.twitter_url}"><svg class="icon-twitter" role="img" title="Twitter" viewbox="0 0 30 30" width="30" height="30"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#twitter"></use></svg><span class="svg-fallback">Twitter</span></a></li>
                {/if}
                {if $template_option.facebook_url}
                    <li><a href="{$template_option.facebook_url}"><svg class="icon-facebook" role="img" title="Facebook" viewbox="0 0 30 30" width="30" height="30"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#facebook"></use></svg><span class="svg-fallback">Facebook</span></a></li>
                {/if}
                {if $template_option.instagram_url}
                    <li><a href="{$template_option.instagram_url}"><svg class="icon-instagram" role="img" title="Instagram" viewbox="0 0 30 30" width="30" height="30"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#instagram"></use></svg><span class="svg-fallback">Instagram</span></a></li>
                {/if}
                {if $template_option.github_url}
                    <li><a href="{$template_option.github_url}"><svg class="icon-github" role="img" title="Github" viewbox="0 0 30 30" width="30" height="30"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#github"></use></svg><span class="svg-fallback">GitHub</span></a></li>
                {/if}
                {if $template_option.flickr_url}
                    <li><a href="{$template_option.flickr_url}"><svg class="icon-flickr" role="img" title="flickr" viewbox="0 0 30 30" width="30" height="30"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#flickr"></use></svg><span class="svg-fallback">flickr</span></a></li>
                {/if}
                {if $template_option.xing_url}
                    <li><a href="{$template_option.xing_url}"><svg class="icon-xing" role="img" title="Xing" viewbox="0 0 30 30" width="30" height="30"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#xing"></use></svg><span class="svg-fallback">Xing</span></a></li>
                {/if}
                {if $template_option.pinboard_url}
                    <li><a href="{$template_option.pinboard_url}"><svg class="icon-pinboard" role="img" title="Pinboard" viewbox="0 0 30 30" width="30" height="30"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#pinboard"></use></svg><span class="svg-fallback">Pinboard</span></a></li>
                {/if}
                {if $template_option.lastfm_url}
                    <li><a href="{$template_option.lastfm_url}"><svg class="icon-lastfm" role="img" title="Last.fm" viewbox="0 0 30 30" width="30" height="30"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#lastfm"></use></svg><span class="svg-fallback">Last.fm</span></a></li>
                {/if}
                {if $template_option.amazon_url}
                    <li><a href="{$template_option.amazon_url}"><svg class="icon-amazon" role="img" title="Amazon" viewbox="0 0 30 30" width="30" height="30"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#amazon"></use></svg><span class="svg-fallback">Amazon</span></a></li>
                {/if}
                </ul>
            </section>
        {/if}
            <section id="search" class="widget">
                <form action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
                    <input type="hidden" name="serendipity[action]" value="search">

                    <label for="searchterm">{$CONST.QUICKSEARCH}</label>
                    <input id="searchterm" type="search" name="serendipity[searchTerm]" value="">
                    <input type="submit" name="serendipity[searchButton]" value="{$CONST.GO}">
                </form>
                {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
            </section>
        {if $leftSidebarElements > 0}
            {serendipity_printSidebar side="left"}
        {/if}
        {if $rightSidebarElements > 0}
            {serendipity_printSidebar side="right"}
        {/if}
        </aside>
    </div>

    <footer id="site-info">
        <nav id="service-nav">
            <ul>
            {if $template_option.privacy_url}
                <li><a href="{$template_option.privacy_url}">{$template_option.privacy_txt}</a></li>
            {/if}
            {if $template_option.legal_url}
                <li><a href="{$template_option.legal_url}">{$template_option.legal_txt}</a></li>
            {/if}
                <li><small lang="en">Powered by <a href="http://s9y.org">Serendipity</a></small></li>
                <li><small lang="en">Template by <a href="http://netzgestaltung.net">Matthias Mees</a></small></li>
            </ul>
        </nav>
    </footer>

    <script src="{serendipity_getFile file="scripts/master.js"}"></script>
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
