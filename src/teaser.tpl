{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{foreach from=$entries item="dategroup"}
{foreach from=$dategroup.entries item="entry"}
    <li><a href="{$entry.link}">{$entry.title}</a>
        <time datetime="{$entry.timestamp|serendipity_html5time}">{$entry.timestamp|formatTime:$template_option.date_format}</time>
    {if $template_option.home_teasers}
        <div class="post-teaser">
            <p>{$entry.body|strip_tags|truncate:250:" [&hellip;]"}{if $entry.comments > 0} (<a href="{$entry.link}#comments" title="{$entry.comments} {$entry.label_comments}{if $entry.has_trackbacks}, {$entry.trackbacks} {$entry.label_trackbacks}{/if}">{$entry.comments} {$entry.label_comments}</a>{/if})</p>
        </div>
    {/if}
    </li>
{/foreach}
{/foreach}
{serendipity_hookPlugin hook="entries_footer"}
