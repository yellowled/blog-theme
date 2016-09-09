{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if $footer_info}<p class="content_message">{$footer_info}</p>{/if}
{foreach from=$entries item="dategroup"}
    {foreach from=$dategroup.entries item="entry"}
    {assign var="entry" value=$entry scope=parent}
    <article class="post{if $dategroup.is_sticky} is_sticky{/if}">
        <h2>{if not $is_single_entry}<a href="{$entry.link}">{/if}{$entry.title}{if not $is_single_entry}</a>{/if}</h2>

        <div class="content clearfix">
        {$entry.body}
        {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
        <a class="read_more" href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a>
        {/if}
        </div>
        {if $entry.is_extended}
        <div id="extended" class="content clearfix">
        {$entry.extended}
        </div>
        {/if}

        <footer class="post_meta">
            <ul>
                <li class="post_created">{if $template_option.multiuser}{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a> {$CONST.ON} {/if}<time datetime="{$entry.timestamp|serendipity_html5time}">{$entry.timestamp|formatTime:$template_option.date_format}</time></li>
            {if $entry.categories && $template_option.show_categories}
                <li class="post_categories"><span class="visuallyhidden">{$CONST.CATEGORIES}: </span>{foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}</li>
            {/if}
            {if $entry.freetag.tags.tags}
                <li class="post_tags">{foreach from=$entry.freetag.tags.tags item="tag"}{$tag} {/foreach}</li>
            {/if}
            {if $entry.has_comments}
                <li class="post_comments"><a href="{$entry.link}{if $entry.comments > 0}#comments{else}#reply{/if}" title="{$entry.comments} {$entry.label_comments}{if $entry.has_trackbacks}, {$entry.trackbacks} {$entry.label_trackbacks}{/if}">{if $entry.comments > 0}{$entry.comments} {$entry.label_comments}{else}{$CONST.ADD_COMMENT}{/if}</a></li>
            {/if}
            </ul>
            {$entry.add_footer}
            {$entry.plugin_display_dat}
        </footer>
        <!--
        <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                 xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/"
                 xmlns:dc="http://purl.org/dc/elements/1.1/">
        <rdf:Description
                 rdf:about="{$entry.link_rdf}"
                 trackback:ping="{$entry.link_trackback}"
                 dc:title="{$entry.title_rdf|default:$entry.title}"
                 dc:identifier="{$entry.rdf_ident}" />
        </rdf:RDF>
        -->
{if $is_single_entry and not $use_popups and not $is_preview}
    {if $CONST.DATA_UNSUBSCRIBED}
        <p class="serendipity_msg_notice">{$CONST.DATA_UNSUBSCRIBED|sprintf:$CONST.UNSUBSCRIBE_OK}</p>
    {/if}
    {if $CONST.DATA_TRACKBACK_DELETED}
        <p class="serendipity_msg_important">{$CONST.DATA_TRACKBACK_DELETED|sprintf:$CONST.TRACKBACK_DELETED}</p>
    {/if}
    {if $CONST.DATA_TRACKBACK_APPROVED}
        <p class="serendipity_msg_notice">{$CONST.DATA_TRACKBACK_APPROVED|sprintf:$CONST.TRACKBACK_APPROVED}</p>
    {/if}
    {if $CONST.DATA_COMMENT_DELETED}
        <p class="serendipity_msg_important">{$CONST.DATA_COMMENT_DELETED|sprintf:$CONST.COMMENT_DELETED}</p>
    {/if}
    {if $CONST.DATA_COMMENT_APPROVED}
        <p class="serendipity_msg_notice">{$CONST.DATA_COMMENT_APPROVED|sprintf:$CONST.COMMENT_APPROVED}</p>
    {/if}
    {if $entry.trackbacks > 0}
    <section id="trackbacks" class="feedback">
        <h3>{$entry.trackbacks} {$entry.label_trackbacks}</h3>

        {serendipity_printTrackbacks entry=$entry.id}
    </section>
    {/if}
{/if}
{if $is_single_entry and not $is_preview}
    {if $entry.comments > 0}
    <section id="comments" class="feedback">
        <h3>{$entry.comments} {$entry.label_comments}</h3>

        {serendipity_printComments entry=$entry.id mode=$entry.viewmode}
    </section>
    {/if}
    <a id="feedback"></a>
    {foreach from=$comments_messagestack item="message"}
    <p class="serendipity_msg_important">{$message}</p>
    {/foreach}
    {if $is_comment_added}
    <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED}</p>
    {elseif $is_comment_moderate}
    <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED}{$CONST.THIS_COMMENT_NEEDS_REVIEW}</p>
    {elseif not $entry.allow_comments}
    <p class="serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</p>
    {else}
    <section id="reply" class="feedback">
        <h3>{$CONST.ADD_COMMENT}</h3>
        {$COMMENTFORM}
	</section>
    {/if}
{/if}
    {$entry.backend_preview}
    </article>
    {/foreach}
{foreachelse}
    {if not $plugin_clean_page}
    <p class="serendipity_msg_notice">{$CONST.NO_ENTRIES_TO_PRINT}</p>
    {/if}
{/foreach}
{serendipity_hookPlugin hook="entries_footer"}
{if not $is_preview}
    {if $footer_prev_page||$footer_next_page}
    <nav class="pagination" role="navigation">
        <ul>
        {if $footer_prev_page}
            <li class="prev_page"><a href="{$footer_prev_page}" aria-label="{$CONST.PREVIOUS_PAGE}"><svg class="icon-chevron-left" role="img" title="{$CONST.PREVIOUS_PAGE}" viewbox="0 0 2048 2048" width="2048" height="2048"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#chevron-left"></use></svg><span class="svg-fallback">&laquo;</span></a></li>
        {/if}
        {if $footer_next_page}
            <li class="next_page"><a href="{$footer_next_page}" aria-label="{$CONST.NEXT_PAGE}"><svg class="icon-chevron-right" role="img" title="{$CONST.NEXT_PAGE}" viewbox="0 0 2048 2048" width="2048" height="2048"><use xlink:href="{$serendipityHTTPPath}templates/{$template}/img/sprite.svg#chevron-right"></use></svg><span class="svg-fallback">&raquo;</span></a></li>
        {/if}
        </ul>
    </nav>
    {/if}
{/if}
