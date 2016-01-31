{serendipity_hookPlugin hook="entries_header"}
<article class="archive archive-overview">
    <h2>{$CONST.ARCHIVES}</h2>

    {serendipity_showPlugin class="serendipity_plugin_categories"}
    {serendipity_showPlugin class="serendipity_plugin_freetag"}

    <h3>{$CONST.BT_CHRONOLOGICAL}</h3>
{foreach from=$archives item="archive"}
    <section class="archive-year">
        <h4>{$archive.year}</h4>

        <ul>
        {foreach from=$archive.months item="month"}
            <li><span class="date">{if $month.entry_count}<a href="{$month.link}" title="{$CONST.VIEW_FULL}">{/if}{$month.date|formatTime:"%B"}{if $month.entry_count}</a>{/if}:</span>
                <span class="count">{if $month.entry_count}<a href="{$month.link_summary}" title="{$CONST.VIEW_TOPICS}">{/if}{$month.entry_count} {$CONST.ENTRIES}{if $month.entry_count}</a>{/if}</span>
            </li>
        {/foreach}
        </ul>
    </section>
{/foreach}
</article>
{serendipity_hookPlugin hook="entries_footer"}
