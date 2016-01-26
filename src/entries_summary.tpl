{serendipity_hookPlugin hook="entries_header"}
<article class="archive">
	<h2>{$dateRange.0|formatTime:"%B %Y"}</h2>

	<ul class="summary">
	{foreach from=$entries item="sentries"}
        {foreach from=$sentries.entries item="entry"}
        <li><a href="{$entry.link}">{$entry.title}</a>
            {if $template_option.multiuser}<span>{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a> {$CONST.ON} {/if}
            <time datetime="{$entry.timestamp|serendipity_html5time}">{$entry.timestamp|formatTime:$template_option.date_format}</time>
            {if $template_option.multiuser}</span>{/if}
        </li>
        {/foreach}
    {/foreach}
	</ul>
</article>
{serendipity_hookPlugin hook="entries_footer"}
