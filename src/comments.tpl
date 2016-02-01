{foreach from=$comments item=comment name="comments"}
    <article id="c{$comment.id}" class="comment commentlevel_{if $comment.depth > 8}9{else}{$comment.depth}{/if}">
        <h4>{if $comment.url}<a href="{$comment.url}">{/if}{$comment.author|default:$CONST.ANONYMOUS}{if $comment.url}</a>{/if}:</h4>

        <div class="content clearfix">
        {if $comment.body == 'COMMENT_DELETED'}
            <p class="serendipity_msg_important">{$CONST.COMMENT_IS_DELETED}</p>
        {else}
            {if $comment.avatar}{$comment.avatar}{/if}
            {$comment.body}
        {/if}
        </div>

        <footer class="comment_meta">
            <ul>
                <li><a href="#c{$comment.id}">#</a></li>
                <li><time datetime="{$comment.timestamp|serendipity_html5time}">{$comment.timestamp|formatTime:$template_option.date_format}</time></li>
            {if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'}
                <li><a id="serendipity_reply_{$comment.id}" class="comment_reply" href="#serendipity_CommentForm">{$CONST.REPLY}</a>
                    <div id="serendipity_replyform_{$comment.id}" class="visuallyhidden"></div>
                </li>
            {/if}
            </ul>
        </footer>
    </article>
{/foreach}
