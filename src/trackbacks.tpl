{foreach from=$trackbacks item=trackback}
    <article id="c{$trackback.id}" class="trackback">
        <h4>{$trackback.author|default:$CONST.ANONYMOUS} {$CONST.ON} <time datetime="{$trackback.timestamp|serendipity_html5time}">{$trackback.timestamp|formatTime:$template_option.date_format}</time>: <a href="{$trackback.url|strip_tags}">{$trackback.title}</a></h4>
	{if $trackback.body == ''}
		<p>{$CONST.NO_ENTRIES_TO_PRINT}</p>
	{else}
        <details>
            <summary>{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$trackback.title}</summary>
            <div class="content">{$trackback.body|strip_tags|escape:'htmlall'}</div>
        </details>
    {/if}
    </article>
{foreachelse}
    <p class="serendipity_msg_notice">{$CONST.NO_TRACKBACKS}</p>
{/foreach}
