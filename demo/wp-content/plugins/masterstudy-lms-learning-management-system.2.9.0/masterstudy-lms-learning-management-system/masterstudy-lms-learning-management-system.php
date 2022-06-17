<?php
/*
Plugin Name: MasterStudy LMS – WordPress Course Plugin
Plugin URI: http://masterstudy.stylemixthemes.com/lms-plugin/
Description: Create brilliant lessons with videos, graphs, images, slides and any other attachments thanks to flexible and user-friendly lesson management tool powered by WYSIWYG editor.
As the ultimate LMS WordPress Plugin, MasterStudy makes it simple and hassle-free to build, customize and manage your Online Education WordPress website.
Author: StylemixThemes
Author URI: https://stylemixthemes.com/
Text Domain: masterstudy-lms-learning-management-system
Version: 2.9.0
*/

if ( ! defined( 'ABSPATH' ) ) {
	exit;
} //Exit if accessed directly

define( 'STM_LMS_FILE', __FILE__ );
define( 'STM_LMS_DIR', __DIR__ );
define( 'STM_LMS_PATH', dirname( STM_LMS_FILE ) );
define( 'STM_LMS_URL', plugin_dir_url( STM_LMS_FILE ) );
define( 'STM_LMS_VERSION', '2.9.0' );
define( 'STM_LMS_DB_VERSION', '2.8.8' );
define( 'STM_LMS_BASE_API_URL', '/wp-json/lms' );

/*** mailchimp integration ***/
if ( is_admin() ) {
	if ( file_exists( STM_LMS_DIR . '/libraries/stm-mailchimp-integration/stm-mailchimp.php' ) ) {
		require_once STM_LMS_DIR . '/libraries/stm-mailchimp-integration/stm-mailchimp.php';

		$plugin_pages      = array( 'stm-lms-settings' );
		$plugin_post_types = array(
			'stm-courses',
			'stm-lessons',
			'stm-quizzes',
			'stm-questions',
			'stm-reviews',
			'stm-orders',
		);
		$plugin_actions    = array(
			'stm_mailchimp_integration_add_masterstudy-lms-learning-management-system',
			'stm_mailchimp_integration_not_allowed_masterstudy-lms-learning-management-system',
			'stm_mailchimp_integration_remove_masterstudy-lms-learning-management-system',
			'stm_mailchimp_integration_not_allowed_masterstudy-lms-learning-management-system',
		);

		if ( stm_mailchimp_is_show_page( $plugin_actions, $plugin_pages, $plugin_post_types ) !== false ) {
			if ( ! function_exists( 'is_plugin_active' ) ) {
				include_once( ABSPATH . 'wp-admin/includes/plugin.php' );
			}

			add_action( 'plugins_loaded', 'init_ms_mailchimp', 10, 1 );
			function init_ms_mailchimp() {
				$installed_plugins = get_plugins();
				$pro_slug          = 'masterstudy-lms-learning-management-system-pro/masterstudy-lms-learning-management-system-pro.php';
				$is_pro_exist      = array_key_exists( $pro_slug, $installed_plugins ) || in_array( $pro_slug, $installed_plugins, true );

				$init_data = array(
					'plugin_title' => 'Masterstudy',
					'plugin_name'  => 'masterstudy-lms-learning-management-system',
					'is_pro'       => $is_pro_exist,
				);
				if ( function_exists( 'wp_get_current_user' ) ) {
					stm_mailchimp_admin_init( $init_data );
				}
			}
		}
	}
}
/*** mailchimp integration | end ***/

if ( ! is_textdomain_loaded( 'masterstudy-lms-learning-management-system' ) ) {
	load_plugin_textdomain(
		'masterstudy-lms-learning-management-system',
		false,
		'masterstudy-lms-learning-management-system/languages'
	);
}

require_once STM_LMS_PATH . '/post_type/posts.php';
require_once STM_LMS_PATH . '/db/tables.php';
require_once STM_LMS_PATH . '/lms/main.php';
require_once STM_LMS_PATH . '/lms/widgets/main.php';


require_once STM_LMS_PATH . '/lms/classes/vendor/autoload.php';
require_once STM_LMS_PATH . '/lms/classes/abstract/autoload.php';
require_once STM_LMS_PATH . '/lms/classes/models/autoload.php';
require_once STM_LMS_PATH . '/libraries/autoload.php';
require_once STM_LMS_PATH . '/lms/init.php';
require_once STM_LMS_PATH . '/lms/route.php';

require_once STM_LMS_PATH . '/nuxy/NUXY.php';
require_once STM_LMS_PATH . '/visual_composer/main.php';

if ( ! class_exists( 'Vc_Manager' ) ) {
	require_once STM_LMS_PATH . '/shortcodes/shortcodes.php';
}
require_once STM_LMS_PATH . '/user_manager/main.php';

require_once STM_LMS_PATH . '/settings/curriculum/main.php';
require_once STM_LMS_PATH . '/settings/questions_v1/main.php';
require_once STM_LMS_PATH . '/settings/questions_v2/main.php';
require_once STM_LMS_PATH . '/settings/answers/main.php';
require_once STM_LMS_PATH . '/settings/order/main.php';
require_once STM_LMS_PATH . '/settings/faq/main.php';
require_once STM_LMS_PATH . '/settings/drip_content/main.php';
require_once STM_LMS_PATH . '/settings/lms_wpcfto_helpers.php';
require_once STM_LMS_PATH . '/settings/lms_wpcfto_ajax.php';
require_once STM_LMS_PATH . '/settings/page_generator/main.php';

require_once STM_LMS_PATH . '/settings/main_settings.php';

if ( is_admin() ) {
	require_once STM_LMS_PATH . '/compatibility/main.php';
	require_once STM_LMS_PATH . '/lms/generate_styles.php';
	require_once STM_LMS_PATH . '/lms/admin_helpers.php';
	require_once STM_LMS_PATH . '/db/fix_rating.php';
	require_once STM_LMS_PATH . '/announcement/main.php';
	require_once STM_LMS_PATH . '/announcement/item-announcements.php';
	require_once STM_LMS_PATH . '/wizard/main.php';

	/*Settings Config*/
	require_once STM_LMS_PATH . '/settings/lms_metaboxes.php';
	require_once STM_LMS_PATH . '/settings/course_taxonomy.php';
	require_once STM_LMS_PATH . '/settings/stm_lms_shortcodes/main.php';
	require_once STM_LMS_PATH . '/settings/stm_lms_certificate_banner/main.php';
	require_once STM_LMS_PATH . '/settings/demo_import/main.php';
	require_once STM_LMS_PATH . '/settings/order/main.php';
	require_once STM_LMS_PATH . '/settings/payments/main.php';
	require_once STM_LMS_PATH . '/settings/payout/main.php';
}


