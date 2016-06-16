<?php
if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
                                     'currpage2' => $_SERVER['REQUEST_URI']));

$serendipity['smarty']->assign('last_template_change', $serendipity['last_template_change']);

if (class_exists('serendipity_event_spamblock')) {
    $required_fieldlist = serendipity_db_query("SELECT value FROM {$serendipity['dbPrefix']}config WHERE name LIKE '%spamblock%required_fields'", true, 'assoc');
} elseif (class_exists('serendipity_event_commentspice')) {
    $required_fieldlist = serendipity_db_query("SELECT value FROM {$serendipity['dbPrefix']}config WHERE name LIKE '%commentspice%required_fields'", true, 'assoc');
}

if (is_array($required_fieldlist)) {
    $required_fields = explode(',', $required_fieldlist['value']);
    $smarty_required_fields = array();

    foreach($required_fields AS $required_field) {
        $required_field = trim($required_field);

        if (empty($required_field)) continue;
            $smarty_required_fields[$required_field] = $required_field;
        }

    $serendipity['smarty']->assign('required_fields', $smarty_required_fields);
}

$template_config = array(
    array(
        'var' => 'date_format',
        'name' => GENERAL_PLUGIN_DATEFORMAT . " (http://php.net/strftime)",
        'type' => 'select',
        'default' => DATE_FORMAT_ENTRY,
        'select_values' => array(DATE_FORMAT_ENTRY => DATE_FORMAT_ENTRY,
                                '%A, %e. %B %Y' => '%A, %e. %B %Y',
                                '%a, %e. %B %Y' => '%a, %e. %B %Y',
                                '%e. %B %Y' => '%e. %B %Y',
                                '%d.%m.%y' => '%d.%m.%y',
                                '%d.%m.%Y' => '%d.%m.%Y',
                                '%A, %m/%d/%Y' => '%A, %m/%d/%Y',
                                '%a, %m/%d/%y' => '%a, %m/%d/%y',
                                '%m/%d/%y' => '%m/%d/%y',
                                '%m/%d/%Y' => '%m/%d/%Y',
                                '%Y-%m-%d' => '%Y-%m-%d')
    ),
    array(
       'var' => 'multiuser',
       'name' => BT_MULTIUSER,
       'type' => 'boolean',
       'default' => false
    ),
    array(
       'var' => 'show_categories',
       'name' => BT_SHOW_CATEGORIES,
       'type' => 'boolean',
       'default' => false
    ),
    array(
       'var' => 'threaded_comments',
       'name' => BT_THREADED_COMMENTS,
       'type' => 'boolean',
       'default' => true
    ),
    array(
       'var' => 'adaptive_images',
       'name' => BT_ADAPTIVE_IMAGES,
       'type' => 'boolean',
       'default' => true
    ),
    array(
        'var' => 'siteverification',
        'name' => BT_SITE_VERIFICATION,
        'type' => 'string',
        'default' => ''
    ),
    array(
        'var' => 'identity',
        'name' => BT_IDENTITY,
        'type' => 'text',
        'default' => '<h1>' . $serendipity['blogTitle'] . "</h1>\n<p>" . $serendipity['blogDescription'] . '</p>'
    ),
    array(
        'var' => 'home_greeter_title',
        'name' => BT_GREETER_TITLE,
        'type' => 'string',
        'default' => BT_GREETER_TITLE_DEFAULT
    ),
    array(
        'var' => 'home_greeter_txt',
        'name' => BT_GREETER_TXT,
        'type' => 'text',
        'default' => ''
    ),
    array(
        'var' => 'home_title',
        'name' => BT_HOME_TITLE,
        'type' => 'string',
        'default' => BT_HOME_TITLE_DEFAULT
    ),
    array(
        'var' => 'infobox_title',
        'name' => BT_INFOBOX_TITLE,
        'type' => 'string',
        'default' => BT_INFOBOX_TITLE_DEFAULT
    ),
    array(
        'var' => 'infobox_img',
        'name' => BT_INFOBOX_IMG,
        'type' => 'media',
        'default' => serendipity_getTemplateFile('me.jpg')
    ),
    array(
        'var' => 'infobox_txt',
        'name' => BT_INFOBOX_TXT,
        'type' => 'text',
        'default' => ''
    ),
    array(
        'var' => 'infobox_more_txt',
        'name' => BT_INFOBOX_MORE_TXT,
        'type' => 'string',
        'default' => BT_INFOBOX_MORE_TXT_DEFAULT
    ),
    array(
        'var' => 'infobox_more_url',
        'name' => BT_INFOBOX_MORE_URL,
        'type' => 'string',
        'default' => ''
    ),
    array(
        'var' => 'privacy_txt',
        'name' => BT_PRIVACY_TXT,
        'type' => 'string',
        'default' => BT_PRIVACY_TXT_DEFAULT
    ),
    array(
        'var' => 'privacy_url',
        'name' => BT_PRIVACY_URL,
        'type' => 'string',
        'default' => ''
    ),
    array(
        'var' => 'legal_txt',
        'name' => BT_LEGAL_TXT,
        'type' => 'string',
        'default' => BT_LEGAL_TXT_DEFAULT
    ),
    array(
        'var' => 'legal_url',
        'name' => BT_LEGAL_URL,
        'type' => 'string',
        'default' => ''
    ),
    array(
        'var' => 'twitter_url',
        'name' => BT_TWITTER_URL,
        'type' => 'string',
        'default' => ''
    ),
    array(
        'var' => 'facebook_url',
        'name' => BT_FACEBOOK_URL,
        'type' => 'string',
        'default' => ''
    ),
    array(
        'var' => 'instagram_url',
        'name' => BT_INSTAGRAM_URL,
        'type' => 'string',
        'default' => ''
    ),
    array(
        'var' => 'github_url',
        'name' => BT_GITHUB_URL,
        'type' => 'string',
        'default' => ''
    ),
    array(
        'var' => 'xing_url',
        'name' => BT_XING_URL,
        'type' => 'string',
        'default' => ''
    ),
    array(
        'var' => 'pinboard_url',
        'name' => BT_PINBOARD_URL,
        'type' => 'string',
        'default' => ''
    ),
    array(
        'var' => 'lastfm_url',
        'name' => BT_LASTFM_URL,
        'type' => 'string',
        'default' => ''
    ),
    array(
        'var' => 'amazon_url',
        'name' => BT_AMAZON_URL,
        'type' => 'string',
        'default' => ''
    ),
    array(
       'var' => 'use_corenav',
       'name' => USE_CORENAV,
       'type' => 'boolean',
       'default' => true
    )
);

$template_global_config = array('navigation' => true);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $serendipity['smarty_vars']['template_option'], true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

$navlinks_collapse = array( 'use_corenav', 'amount');
for ($i = 0; $i < $template_loaded_config['amount']; $i++) {
	array_push($navlinks_collapse, 'navlink' . $i . 'text' ,'navlink' . $i . 'url');
}

$template_config_groups = array(
    BT_SETTINGS      => array('date_format', 'multiuser', 'show_categories', 'threaded_comments', 'adaptive_images', 'siteverification'),
    BT_HEADER        => array('identity'),
    BT_HOME          => array('home_greeter_title', 'home_greeter_txt', 'home_title'),
    BT_INFOBOX       => array('infobox_title', 'infobox_img', 'infobox_txt', 'infobox_more_txt', 'infobox_more_url'),
    BT_SOCIALLINKS   => array('twitter_url', 'facebook_url', 'instagram_url', 'github_url', 'xing_url', 'pinboard_url', 'lastfm_url', 'amazon_url'),
    BT_FOOTERLINKS   => array('privacy_txt', 'privacy_url', 'legal_txt', 'legal_url'),
    BT_NAVIGATION    => $navlinks_collapse
);

if ($_SESSION['serendipityUseTemplate']) {
    $template_loaded_config['use_corenav'] = false;
}
