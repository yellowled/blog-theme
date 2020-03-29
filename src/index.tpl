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
        <div class="masthead">
            <a href="{$serendipityBaseURL}">{$template_option.identity}</a>

            <button id="open-nav" class="open-nav" type="button" aria-controls="site-nav" aria-label="{$CONST.BT_NAV_OPEN}"><svg class="icon-bars" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="448" height="512"><path d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"/></svg></button>
        </div>
    </header>

    <nav id="site-nav" class="site-nav" aria-hidden="true">
        <div>
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
            {if $navlink.title!="" && $navlink.href!=""}
                <li>{if $currpage==$navlink.href or $currpage2==$navlink.href}<span>{else}<a href="{$navlink.href}">{/if}{$navlink.title}{if $currpage==$navlink.href or $currpage2==$navlink.href}</span>{else}</a>{/if}</li>
            {/if}
            {/foreach}
            </ul>
        {/if}
            <button id="close-nav" class="close-nav" type="button"  aria-controls="site-nav" aria-label="{$CONST.BT_NAV_CLOSE}"><svg class="icon-times" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" width="352" height="512"><path d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"/></svg></button>
        </div>
    </nav>

    <main>
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
                    <li><a class="link-rss" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" aria-label="RSS"><svg class="icon-rss" aria-hidden="true" width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg"><path d="M9.1,13.548 C9.098,11.222 8.153,9.115 6.622,7.584 C5.095,6.055 2.989,5.108 0.662,5.108 L0.662,7.549 C2.256,7.551 3.765,8.176 4.891,9.307 C6.021,10.433 6.643,11.943 6.647,13.543 L6.647,13.547 L9.1,13.547 L9.1,13.548 Z"></path><path d="M13.451,13.548 C13.449,10.024 12.016,6.828 9.7,4.512 C7.383,2.194 4.19,0.761 0.667,0.759 L0.667,3.2 C6.364,3.204 10.999,7.844 11.001,13.548 L13.451,13.548 L13.451,13.548 Z"></path><path d="M1.157,10.646 C0.85,10.953 0.658,11.374 0.658,11.841 C0.658,12.307 0.85,12.728 1.157,13.035 C1.468,13.343 1.887,13.533 2.358,13.533 C2.829,13.533 3.251,13.343 3.559,13.035 L3.561,13.035 C3.87,12.727 4.058,12.306 4.059,11.841 C4.058,11.373 3.87,10.952 3.559,10.646 C3.248,10.336 2.829,10.148 2.358,10.148 C1.887,10.148 1.468,10.337 1.157,10.646 L1.157,10.646 Z"></path></svg></a></li>
                {if $template_option.twitter_url}
                    <li><a class="link-twitter" href="{$template_option.twitter_url}" aria-label="Twitter"><svg class="icon-witter" aria-hidden="true" width="19" height="16" viewBox="0 0 19 16" xmlns="http://www.w3.org/2000/svg"><g transform="translate(-146.000000, -362.000000)"><path d="M164.775,364.585 C164.107,364.882 163.387,365.084 162.632,365.171 C163.403,364.71 163.993,363.979 164.274,363.109 C163.552,363.537 162.755,363.847 161.904,364.014 C161.224,363.29 160.256,362.836 159.184,362.836 C157.124,362.836 155.455,364.505 155.455,366.565 C155.455,366.857 155.488,367.143 155.552,367.417 C152.453,367.259 149.705,365.775 147.866,363.519 C147.544,364.072 147.361,364.711 147.361,365.395 C147.361,366.688 148.019,367.829 149.02,368.499 C148.409,368.48 147.833,368.311 147.33,368.033 L147.33,368.081 C147.33,369.887 148.616,371.393 150.323,371.736 C150.008,371.821 149.678,371.868 149.341,371.868 C149.101,371.868 148.865,371.845 148.638,371.8 C149.113,373.281 150.491,374.361 152.122,374.389 C150.845,375.39 149.237,375.985 147.49,375.985 C147.189,375.985 146.892,375.969 146.601,375.933 C148.251,376.994 150.209,377.61 152.316,377.61 C159.174,377.61 162.924,371.927 162.924,367 C162.924,366.838 162.921,366.678 162.914,366.519 C163.645,365.988 164.274,365.333 164.775,364.585 L164.775,364.585 Z"></path></g></svg></a></li>
                {/if}
                {if $template_option.facebook_url}
                    <li><a class="link-facebook" href="{$template_option.facebook_url}" aria-label="Facebook"><svg class="icon-facebook" aria-hidden="true" width="9" height="19" viewBox="0 0 9 19" xmlns="http://www.w3.org/2000/svg"><path d="M5.87,9.162 L5.87,18.032 L2.23,18.032 L2.23,9.162 L0.45,9.162 L0.45,6.172 L2.23,6.172 L2.23,3.733 C2.23,3.293 2.139,0.302 5.959,0.302 L8.659,0.302 L8.659,3.412 L6.669,3.412 C6.279,3.412 5.879,3.822 5.879,4.122 L5.879,6.162 L8.65,6.162 C8.54,7.732 8.309,9.162 8.309,9.162 L5.87,9.162 L5.87,9.162 Z"></path></svg></a></li>
                {/if}
                {if $template_option.instagram_url}
                    <li><a class="link-instagram" href="{$template_option.instagram_url}" aria-label="Instagram"><svg class="icon-instagram" aria-hidden="true" width="15" height="16" viewBox="0 0 15 16" xmlns="http://www.w3.org/2000/svg"><g transform="translate(-257.000000, -182.000000)"><path d="M258.604,182.933 C257.742,182.933 257.042,183.633 257.042,184.495 L257.042,196.281 C257.042,197.144 257.741,197.843 258.604,197.843 L270.391,197.843 C271.253,197.843 271.953,197.144 271.953,196.281 L271.953,184.495 C271.953,183.633 271.253,182.933 270.391,182.933 L258.604,182.933 L258.604,182.933 Z M264.506,187.444 C266.12,187.444 267.428,188.752 267.428,190.366 C267.428,191.979 266.12,193.288 264.506,193.288 C262.893,193.288 261.585,191.979 261.585,190.366 C261.585,188.751 262.893,187.444 264.506,187.444 L264.506,187.444 Z M270.249,195.582 C270.249,195.954 269.985,196.108 269.582,196.108 L259.384,196.108 C258.981,196.108 258.717,195.954 258.717,195.582 L258.717,189.211 L259.971,189.211 C259.885,189.565 259.838,189.935 259.838,190.315 C259.838,192.884 261.921,194.968 264.491,194.968 C267.061,194.968 269.144,192.884 269.144,190.315 C269.144,189.934 269.097,189.565 269.011,189.211 L270.248,189.211 C270.249,189.21 270.249,195.209 270.249,195.582 L270.249,195.582 Z M270.265,186.997 C270.265,187.293 270.025,187.532 269.729,187.532 L267.866,187.532 C267.57,187.532 267.33,187.293 267.33,186.997 L267.33,185.134 C267.33,184.837 267.57,184.598 267.866,184.598 L269.729,184.598 C270.025,184.598 270.265,184.837 270.265,185.134 L270.265,186.997 L270.265,186.997 Z"></path></g></svg>
</a></li>
                {/if}
                {if $template_option.github_url}
                    <li><a class="link-github" href="{$template_option.github_url}" aria-label="GitHub"><svg class="icon-github" aria-hidden="true" width="21" height="17" viewBox="0 0 21 17" xmlns="http://www.w3.org/2000/svg"><g transform="translate(-181.000000, -146.000000)"><path d="M201.978,154.62 C201.98,154.622 201.986,154.622 201.99,154.622 C202.021,154.622 202.049,154.599 202.056,154.567 C202.062,154.53 202.036,154.497 202.001,154.488 C201.093,154.322 199.776,154.137 197.538,154.155 C197.677,153.639 197.753,153.028 197.767,152.305 C197.765,150.344 196.826,149.651 196.646,149.325 C196.912,147.841 196.601,147.165 196.457,146.933 C195.926,146.744 194.607,147.418 193.887,147.896 C192.711,147.551 190.231,147.586 189.299,147.984 C187.582,146.755 186.674,146.943 186.674,146.943 C186.674,146.943 186.086,147.995 186.52,149.535 C185.954,150.257 185.534,150.765 185.534,152.116 C185.534,152.878 185.624,153.558 185.825,154.153 C184.927,154.151 182.389,154.272 181.507,154.489 C181.472,154.499 181.45,154.535 181.458,154.571 C181.466,154.601 181.493,154.622 181.524,154.622 C181.528,154.622 181.534,154.622 181.54,154.619 C182.431,154.399 185.03,154.279 185.872,154.286 C185.921,154.415 185.976,154.538 186.036,154.658 C183.866,154.716 182.628,155.026 181.718,155.255 C181.652,155.271 181.585,155.286 181.525,155.302 C181.49,155.311 181.466,155.348 181.476,155.383 C181.484,155.414 181.509,155.434 181.54,155.434 C181.544,155.434 181.55,155.433 181.556,155.432 C181.618,155.416 181.685,155.4 181.749,155.383 C182.663,155.154 183.909,154.843 186.104,154.79 C186.743,155.95 187.971,156.678 190.036,156.887 C190.056,156.889 190.075,156.891 190.093,156.893 C189.794,157.12 189.433,157.551 189.384,158.051 C189.007,158.295 188.251,158.375 187.661,158.19 C186.837,157.929 186.52,156.295 185.284,156.527 C185.016,156.579 185.069,156.755 185.302,156.904 C185.677,157.148 186.032,157.454 186.306,158.102 C186.515,158.601 186.958,159.491 188.355,159.491 C188.908,159.491 189.296,159.425 189.296,159.425 C189.296,159.425 189.306,160.697 189.306,161.193 C189.306,161.763 188.536,161.923 188.536,162.198 C188.536,162.307 188.792,162.317 188.997,162.317 C189.401,162.317 190.243,161.98 190.243,161.386 C190.243,160.915 190.251,159.331 190.251,159.055 C190.251,158.449 190.575,158.257 190.575,158.257 C190.575,158.257 190.616,161.49 190.497,161.923 C190.358,162.434 190.11,162.361 190.11,162.587 C190.11,162.927 191.124,162.671 191.46,161.929 C191.72,161.352 191.606,158.179 191.606,158.179 L191.881,158.173 C191.881,158.173 191.897,159.626 191.887,160.29 C191.879,160.976 191.832,161.846 192.241,162.255 C192.507,162.526 193.38,162.999 193.38,162.567 C193.38,162.316 192.9,162.109 192.9,161.429 L192.9,158.3 C193.283,158.3 193.226,159.329 193.226,159.329 L193.253,161.239 C193.253,161.239 193.169,161.935 194.007,162.228 C194.302,162.331 194.933,162.358 194.964,162.185 C194.993,162.012 194.202,161.752 194.194,161.213 C194.19,160.885 194.21,160.692 194.21,159.264 C194.21,157.836 194.019,157.307 193.349,156.885 C193.574,156.862 193.79,156.834 193.997,156.804 L193.997,156.803 C195.685,156.551 196.757,156.012 197.311,154.794 C198.028,154.818 200.178,154.892 201.918,155.424 C201.926,155.426 201.932,155.426 201.939,155.426 C201.966,155.426 201.992,155.407 202.001,155.379 C202.011,155.344 201.991,155.307 201.956,155.296 C200.241,154.772 198.134,154.69 197.366,154.665 C197.415,154.544 197.46,154.421 197.499,154.29 C199.753,154.268 201.069,154.453 201.978,154.62 L201.978,154.62 Z"></path></g></svg></a></li>
                {/if}
                {if $template_option.xing_url}
                    <li><a class="link-xing" href="{$template_option.xing_url}" aria-label="Xing"><svg class="icon-xing" aria-hidden="true" width="15" height="16" viewBox="0 0 15 16" xmlns="http://www.w3.org/2000/svg"><path d="M10.609,0.413 L5.438,9.517 L8.771,15.386 L12.253,15.386 L8.92,9.517 L14.093,0.413 L10.609,0.413 Z"></path><path d="M3.299,10.858 L5.886,6.581 L3.945,3.149 L0.663,3.149 L2.604,6.581 L0.017,10.858 L3.299,10.858 Z"></path></svg></a></li>
                {/if}
                {if $template_option.pinboard_url}
                    <li><a class="link-pinboard" href="{$template_option.pinboard_url}" aria-label="Pinboard"><svg class="icon-pinboard" aria-hidden="true" width="17" height="18" viewBox="0 0 17 18" xmlns="http://www.w3.org/2000/svg"><g transform="translate(-147.000000, -289.000000)"><path d="M156.559,300.02 L163.916,306.455 L157.568,299.01 L160.691,295.889 L157.807,296.393 L152.812,292.289 L152.812,289.852 L150.227,292.439 L147.461,295.203 L149.691,295.174 L153.912,300.348 L153.348,303.23 L156.559,300.02 Z"></path></g></svg></a></li>
                {/if}
                {if $template_option.lastfm_url}
                    <li><a class="link-lastfm" href="{$template_option.lastfm_url}" aria-label="Last.fm"><svg class="icon-lastfm" aria-hidden="true" width="19" height="11" viewBox="0 0 19 11" xmlns="http://www.w3.org/2000/svg"><g transform="translate(-362.000000, -185.000000)"><path d="M378.079,189.524 C376.696,189.071 375.706,188.903 375.706,187.796 C375.706,187.018 376.308,186.432 377.149,186.432 C377.754,186.432 378.231,186.67 378.665,187.276 L379.811,186.69 C379.227,185.653 378.381,185.132 377.211,185.132 C375.418,185.132 374.315,186.214 374.315,187.837 C374.315,189.502 375.397,190.195 377.497,190.887 C378.665,191.275 379.356,191.513 379.356,192.508 C379.356,193.524 378.448,194.33 377.126,194.283 C375.782,194.238 375.368,193.504 374.88,192.392 C374.097,190.601 373.196,188.497 373.126,188.333 C372.208,186.217 370.405,185.023 368.169,185.023 C365.206,185.023 362.808,187.425 362.808,190.387 C362.808,193.35 365.206,195.751 368.169,195.751 C369.841,195.751 371.333,194.987 372.317,193.79 L371.624,192.192 C370.974,193.434 369.669,194.284 368.169,194.284 C366.021,194.284 364.274,192.54 364.274,190.387 C364.274,188.236 366.02,186.491 368.169,186.491 C369.759,186.491 371.167,187.423 371.735,188.805 L373.446,192.707 L373.645,193.146 C374.338,194.763 375.336,195.679 377.211,195.687 C379.248,195.689 380.807,194.369 380.807,192.55 C380.808,190.823 379.942,190.131 378.079,189.524 L378.079,189.524 Z"></path></g></svg></a></li>
                {/if}
                {if $template_option.amazon_url}
                    <li><a class="link-amazon" href="{$template_option.amazon_url}" aria-label="Amazon"><svg class="icon-amazon" aria-hidden="true" width="19" height="18" viewBox="0 0 19 18" xmlns="http://www.w3.org/2000/svg"><path d="M16.707,15.329 C16.687,15.383 16.674,15.441 16.674,15.504 C16.673,15.597 16.709,15.709 16.791,15.784 C16.869,15.859 16.97,15.888 17.057,15.888 L17.059,15.888 C17.188,15.887 17.296,15.837 17.39,15.763 C18.273,14.969 18.578,13.703 18.591,12.99 L18.589,12.877 L18.589,12.876 C18.582,12.687 18.541,12.544 18.463,12.425 L18.455,12.414 L18.445,12.403 C18.365,12.314 18.289,12.282 18.205,12.246 C17.959,12.151 17.599,12.099 17.164,12.097 C16.853,12.098 16.509,12.128 16.164,12.203 L16.164,12.18 L15.815,12.297 L15.809,12.298 L15.613,12.362 L15.615,12.371 C15.384,12.467 15.174,12.585 14.979,12.726 C14.859,12.818 14.756,12.937 14.751,13.12 C14.747,13.221 14.799,13.337 14.884,13.404 C14.968,13.472 15.065,13.494 15.152,13.494 C15.173,13.494 15.191,13.493 15.209,13.492 L15.225,13.49 L15.239,13.488 C15.409,13.452 15.657,13.428 15.946,13.386 C16.196,13.359 16.458,13.338 16.687,13.338 C16.849,13.338 16.995,13.35 17.094,13.371 C17.143,13.382 17.181,13.395 17.201,13.404 C17.209,13.408 17.214,13.41 17.217,13.413 C17.221,13.427 17.227,13.462 17.226,13.513 C17.229,13.703 17.147,14.059 17.038,14.404 C16.928,14.751 16.796,15.098 16.707,15.329 L16.707,15.329 Z"></path><path d="M10.522,5.405 C10.003,5.444 9.406,5.483 8.807,5.563 C7.89,5.683 6.972,5.842 6.215,6.202 C4.739,6.8 3.743,8.076 3.743,9.95 C3.743,12.303 5.258,13.499 7.173,13.499 C7.81,13.499 8.329,13.419 8.807,13.3 C9.565,13.06 10.203,12.621 10.961,11.824 C11.399,12.422 11.519,12.701 12.276,13.339 C12.475,13.419 12.674,13.419 12.835,13.3 C13.314,12.901 14.151,12.183 14.589,11.785 C14.788,11.625 14.749,11.385 14.629,11.186 C14.191,10.628 13.751,10.149 13.751,9.073 L13.751,5.483 C13.751,3.969 13.872,2.572 12.755,1.536 C11.839,0.698 10.403,0.379 9.286,0.379 L8.807,0.379 C6.775,0.499 4.619,1.376 4.142,3.888 C4.061,4.208 4.301,4.327 4.46,4.367 L6.694,4.646 C6.932,4.607 7.052,4.407 7.092,4.208 C7.291,3.33 8.009,2.891 8.806,2.812 L8.966,2.812 C9.445,2.812 9.963,3.012 10.242,3.41 C10.56,3.888 10.52,4.527 10.52,5.085 L10.52,5.405 L10.522,5.405 Z M10.522,7.717 C10.522,8.634 10.562,9.35 10.084,10.149 C9.806,10.707 9.326,11.066 8.808,11.186 C8.728,11.186 8.609,11.225 8.489,11.225 C7.612,11.225 7.094,10.548 7.094,9.551 C7.094,8.275 7.851,7.676 8.808,7.397 C9.327,7.277 9.924,7.238 10.523,7.238 L10.523,7.717 L10.522,7.717 Z"></path><path d="M0.955,12.784 C0.845,12.784 0.731,12.824 0.65,12.902 C0.568,12.978 0.519,13.09 0.52,13.204 C0.52,13.353 0.598,13.487 0.71,13.575 C2.999,15.564 5.51,17.411 8.885,17.412 C8.95,17.412 9.018,17.411 9.083,17.41 C11.231,17.362 13.661,16.637 15.545,15.452 L15.556,15.445 C15.803,15.297 16.05,15.131 16.283,14.944 C16.428,14.836 16.527,14.669 16.525,14.494 C16.52,14.184 16.258,13.975 15.973,13.975 C15.884,13.974 15.792,13.995 15.704,14.035 C15.608,14.075 15.509,14.118 15.415,14.159 L15.278,14.216 L15.1,14.287 L15.1,14.289 C13.161,15.076 11.123,15.536 9.239,15.577 C9.17,15.578 9.1,15.579 9.034,15.579 C6.069,15.58 3.651,14.206 1.211,12.851 C1.125,12.807 1.041,12.784 0.955,12.784 L0.955,12.784 Z"></path></svg></a></li>
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
    <footer class="page-footer">
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

    <script src="{serendipity_getFile file="js/master.js"}?v={$theme_version}"></script>
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
