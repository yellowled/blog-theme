<article id="page_{$staticpage_pagetitle|makeFilename}" class="page">
    <header>
        <h2>{if $staticpage_articleformat}{if $staticpage_articleformattitle}{$staticpage_articleformattitle|escape}{else}{$staticpage_pagetitle}{/if}{else}{if $staticpage_headline}{$staticpage_headline|escape}{else}{$staticpage_pagetitle}{/if}{/if}</h2>
    </header>
{if $staticpage_pass AND $staticpage_form_pass != $staticpage_pass}
    <form class="staticpage_password_form" action="{$staticpage_form_url}" method="post">
        <label for="serendipity_page_pass">{$CONST.STATICPAGE_PASSWORD_NOTICE}</label>
        <input id="serendipity_page_pass" name="serendipity[pass]" type="password" value="">
        <input name="submit" type="submit" value="{$CONST.GO}">
    </form>
{else}
    {if $staticpage_precontent}
    <div class="content preface clearfix">
    {$staticpage_precontent}
    </div>
    {/if}
    {if $staticpage_content}
    <div class="content clearfix">
    {$staticpage_content}
    </div>
    {/if}
{/if}
{if is_array($staticpage_childpages)}
    <footer>
        <ul class="page_children">
        {foreach from=$staticpage_childpages item="childpage"}
            <li><a href="{$childpage.permalink|escape}" title="{$childpage.pagetitle|escape}">{$childpage.pagetitle|escape}</a></li>
        {/foreach}
        </ul>
    </footer>
{/if}
</article>
