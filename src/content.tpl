{if $searchresult_tooShort or $searchresult_error or $searchresult_noEntries or $searchresult_results or $content_message}
    <p class="content_message">{$content_message}</p>
{/if}
{$ENTRIES}
{$ARCHIVES}
