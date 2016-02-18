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
{if $template_option.siteverification}
    <meta name="google-site-verification" content="{$template_option.siteverification}">
{/if}
    <link rel="dns-prefetch" href="https://ajax.googleapis.com">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Merriweather:400italic,700italic,400,700">
    <link rel="stylesheet" href="{$head_link_stylesheet}">
{if $template_option.adaptive_images}
    <script>document.cookie='resolution='+Math.max(screen.width,screen.height)+("devicePixelRatio" in window ? ","+devicePixelRatio : ",1")+'; path=/';</script>
{/if}
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
    <header id="identity">
        <a href="{$serendipityBaseURL}">
            {$template_option.identity}
        </a>
    </header>
    {if $template_option.use_corenav}
    <nav id="site-nav">
        <ul>
        {foreach from=$navlinks item="navlink" name="sbnav"}
        {if $navlink.title!=""&&$navlink.href!=""}
            <li>{if $currpage==$navlink.href or $currpage2==$navlink.href}<span>{else}<a href="{$navlink.href}">{/if}{$navlink.title}{if $currpage==$navlink.href or $currpage2==$navlink.href}</span>{else}</a>{/if}</li>
        {/if}
        {/foreach}
            <li><a id="show_search" href="#search_inputs">{$CONST.QUICKSEARCH}</a></li>
        </ul>
    </nav>
    {/if}
    <form id="search" action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
        <input type="hidden" name="serendipity[action]" value="search">

        <div id="search_inputs" class="visuallyhidden">
            <label for="searchterm" class="visuallyhidden">{$CONST.QUICKSEARCH}</label>
            <input id="searchterm" type="search" name="serendipity[searchTerm]" value="">
            <input class="visuallyhidden" type="submit" name="serendipity[searchButton]" value="{$CONST.GO}">
        </div>
    </form>
    {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}

    <main>
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

    <aside id="site-info">
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
                    <li><a class="link-rss" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2"><svg class="icon-rss" role="img" title="RSS" viewbox="0 0 29 29" width="29" height="29"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#rss"></use></svg><span class="svg-fallback">RSS</span></a></li>
                {if $template_option.twitter_url}
                    <li><a class="link-twitter" href="{$template_option.twitter_url}"><svg class="icon-twitter" role="img" title="Twitter" viewbox="0 0 30 29" width="30" height="29"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#twitter"></use></svg><span class="svg-fallback">Twitter</span></a></li>
                {/if}
                {if $template_option.facebook_url}
                    <li><a class="link-facebook" href="{$template_option.facebook_url}"><svg class="icon-facebook" role="img" title="Facebook" viewbox="0 0 30 29" width="30" height="29"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#facebook"></use></svg><span class="svg-fallback">Facebook</span></a></li>
                {/if}
                {if $template_option.instagram_url}
                    <li><a class="link-instagram" href="{$template_option.instagram_url}"><svg class="icon-instagram" role="img" title="Instagram" viewbox="0 0 29 29" width="29" height="29"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#instagram"></use></svg><span class="svg-fallback">Instagram</span></a></li>
                {/if}
                {if $template_option.github_url}
                    <li><a class="link-github" href="{$template_option.github_url}"><svg class="icon-github" role="img" title="Github" viewbox="0 0 30 29" width="30" height="29"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#github"></use></svg><span class="svg-fallback">GitHub</span></a></li>
                {/if}
                {if $template_option.xing_url}
                    <li><a class="link-xing" href="{$template_option.xing_url}"><svg class="icon-xing" role="img" title="Xing" viewbox="0 0 29 29" width="29" height="29"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#xing"></use></svg><span class="svg-fallback">Xing</span></a></li>
                {/if}
                {if $template_option.pinboard_url}
                    <li><a class="link-pinboard" href="{$template_option.pinboard_url}"><svg class="icon-pinboard" role="img" title="Pinboard" viewbox="0 0 30 29" width="30" height="29"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#pinboard"></use></svg><span class="svg-fallback">Pinboard</span></a></li>
                {/if}
                {if $template_option.lastfm_url}
                    <li><a class="link-lastfm" href="{$template_option.lastfm_url}"><svg class="icon-lastfm" role="img" title="Last.fm" viewbox="0 0 30 29" width="30" height="29"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#lastfm"></use></svg><span class="svg-fallback">Last.fm</span></a></li>
                {/if}
                {if $template_option.amazon_url}
                    <li><a class="link-amazon" href="{$template_option.amazon_url}"><svg class="icon-amazon" role="img" title="Amazon" viewbox="0 0 30 29" width="30" height="29"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#amazon"></use></svg><span class="svg-fallback">Amazon</span></a></li>
                {/if}
                </ul>
            </section>
        </div>
    </aside>
    {if $leftSidebarElements > 0 || $rightSidebarElements > 0}
    <aside id="sidebar">
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
    <footer id="service">
        <nav>
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

    <script src="{serendipity_getFile file="scripts/master.js"}"></script>
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
