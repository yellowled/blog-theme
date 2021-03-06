{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if $footer_info and not $searchresult_results}<p class="content_message">{$footer_info}</p>{/if}
{foreach from=$entries item="dategroup"}
    {foreach from=$dategroup.entries item="entry"}
    {assign var="entry" value=$entry scope=parent}
    {assign var="age" value=$smarty.now - $entry.timestamp}
    <article class="post{if $dategroup.is_sticky} is_sticky{/if}">
        <h2>{if not $is_single_entry}<a href="{$entry.link}">{/if}{$entry.title}{if not $is_single_entry}</a>{/if}</h2>

    {if $age >= 31556926}
        <p class="outdated"><strong>Vorsicht:</strong> Dieser Artikel ist mindestens ein Jahr alt. Wenn es ein Artikel über Webentwicklung ist, kann es gut sein, dass er inzwischen überholt oder veraltet ist.</p>
    {/if}

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
    <section id="comments" class="feedback">
    {if $entry.comments > 0}
        <h3>{$entry.comments} {$entry.label_comments}</h3>
    {/if}
        {serendipity_printComments entry=$entry.id mode=$entry.viewmode}
    </section>
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
    <div class="post">
        <p class="serendipity_msg_notice">{$CONST.NO_ENTRIES_TO_PRINT}</p>
    </div>
    {/if}
{/foreach}
{serendipity_hookPlugin hook="entries_footer"}
{if not $is_preview}
    {if $footer_prev_page||$footer_next_page}
    <nav class="pagination">
        <ul>
        {if $footer_prev_page}
            <li class="prev_page"><a href="{$footer_prev_page}" aria-label="{$CONST.PREVIOUS_PAGE}"><svg class="icon-chevron-left" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" width="320" height="512"><path d="M34.52 239.03L228.87 44.69c9.37-9.37 24.57-9.37 33.94 0l22.67 22.67c9.36 9.36 9.37 24.52.04 33.9L131.49 256l154.02 154.75c9.34 9.38 9.32 24.54-.04 33.9l-22.67 22.67c-9.37 9.37-24.57 9.37-33.94 0L34.52 272.97c-9.37-9.37-9.37-24.57 0-33.94z"/></svg></a></li>
        {/if}
        {if $footer_next_page}
            <li class="next_page"><a href="{$footer_next_page}" aria-label="{$CONST.NEXT_PAGE}"><svg class="icon-chevron-right" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" width="320" height="512"><path d="M285.476 272.971L91.132 467.314c-9.373 9.373-24.569 9.373-33.941 0l-22.667-22.667c-9.357-9.357-9.375-24.522-.04-33.901L188.505 256 34.484 101.255c-9.335-9.379-9.317-24.544.04-33.901l22.667-22.667c9.373-9.373 24.569-9.373 33.941 0L285.475 239.03c9.373 9.372 9.373 24.568.001 33.941z"/></svg></a></li>
        {/if}
        </ul>
    </nav>
    {/if}
{/if}
