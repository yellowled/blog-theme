{if $staticpage_results}
<div class="search_pages">
    <h3>{$CONST.STATICPAGE_SEARCHRESULTS|sprintf:$staticpage_searchresults}</h3>

    <ul>
    {foreach from=$staticpage_results item="result"}
        <li><a href="{$result.permalink|escape}" title="{$result.pagetitle|escape} ({$result.realname})">{$result.headline}</a>
            <div class="content">{$result.content|strip_tags|truncate:200:"..."}</div>
        </li>
    {/foreach}
    </ul>
</div>
{/if}
