<aside class="search_pages">
    <h3>{$CONST.STATICPAGE_SEARCHRESULTS|sprintf:$staticpage_searchresults}</h3>
    {if $staticpage_results}
    <ul>
    {foreach from=$staticpage_results item="result"}
        <li><h4><a href="{$result.permalink|escape}" title="{$result.pagetitle|escape}">{$result.headline}</a> ({$result.realname})</h4>
            <div class="content">{$result.content|strip_tags|truncate:200:"..."}</div>
        </li>
    {/foreach}
    </ul>
    {else}
    <p class="serendipity_msg_notice">{$CONST.NO_ENTRIES_TO_PRINT}</p>
    {/if}
</aside>
