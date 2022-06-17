<?php

new STM_LMS_User_Menu();

class STM_LMS_User_Menu {
	public function __construct() {
		add_action( 'wp_footer', array( $this, 'float_menu' ) );
		add_action( 'stm_lms_user_float_menu_before', array( $this, 'stm_lms_user_float_menu_styles' ) );

		add_filter( 'stm_lms_sorted_menu', array( $this, 'sorting_menu' ), 10, 5 );
		add_filter( 'stm_lms_sorted_menu_filter_elements', array( $this, 'sorted_menu_filter_elements' ), 10, 2 );
		add_filter( 'stm_lms_sorted_student_menu', array( $this, 'sorting_student_menu' ) );
		add_filter( 'filter_settings_data_values', array( $this, 'filter_saving_values' ) );
	}

	public function float_menu() {
		STM_LMS_Templates::show_lms_template( 'account/float_menu/float_menu' );
	}

	public static function float_menu_enabled() {
		$float_menu       = STM_LMS_Options::get_option( 'float_menu', false );
		$float_menu_guest = STM_LMS_Options::get_option( 'float_menu_guest', true );

		if ( ! is_user_logged_in() && $float_menu ) {
			return $float_menu_guest;
		}

		return apply_filters( 'stm_lms_float_menu_enabled', $float_menu );
	}

	public function stm_lms_user_float_menu_styles() {
		$float_background_color      = esc_attr( STM_LMS_Options::get_option( 'float_background_color', 'rgba(255, 255, 255, 1)' ) );
		$float_text_color            = esc_attr( STM_LMS_Options::get_option( 'float_text_color', 'rgba(39, 48, 68, 1)' ) );
		$is_background_color_default = ! empty( STM_LMS_Options::get_option( 'float_background_color' ) );
		$is_text_color_default       = ! empty( STM_LMS_Options::get_option( 'float_text_color' ) );

		if ( $is_background_color_default ) { ?>
			<style>
				@media (max-width: 768px) {
					body .stm_lms_user_float_menu:not(.__collapsed) .stm_lms_user_float_menu__toggle {
						background-color: <?php echo esc_attr( $float_background_color ); ?> !important;
					}
				}

				.stm_lms_button .stm_lms_user_float_menu__scrolled .stm_lms_user_float_menu__scrolled_label {
					background-color: <?php echo esc_attr( STM_LMS_Helpers::stm_rgba_change_alpha_dynamically( $float_text_color, 1 ) ); ?>;
				}

				.stm_lms_button .stm_lms_user_float_menu .float_menu_item_active {
					background-color: <?php echo esc_attr( STM_LMS_Helpers::stm_rgba_change_alpha_dynamically( $float_text_color, .2 ) ); ?>;
				}

				.stm_lms_button .stm_lms_user_float_menu .float_menu_item:hover:before, .stm_lms_user_float_menu .float_menu_item_active:before {
					background-color: <?php echo esc_attr( $float_text_color ); ?> !important;
				}

				.stm_lms_user_float_menu .stm-lms-logout-button {
					background-color: <?php echo esc_attr( $float_background_color ); ?> !important;
				}

				.stm_lms_user_float_menu .stm_lms_user_float_menu__empty {
					background-color: <?php echo esc_attr( STM_LMS_Helpers::stm_rgba_change_alpha_dynamically( $float_text_color, .2 ) ); ?>;
				}

				.stm_lms_user_float_menu .stm_lms_user_float_menu__tabs a.active {
					color: <?php echo esc_attr( $float_text_color ); ?> !important;
					background-color: <?php echo esc_attr( STM_LMS_Helpers::stm_rgba_change_alpha_dynamically( $float_text_color, .2 ) ); ?>;
				}

				.stm_lms_user_float_menu .stm_lms_user_float_menu__tabs a {
					background-color: <?php echo esc_attr( $float_background_color ); ?>;
					color: <?php echo esc_attr( $float_text_color ); ?> !important;
				}

				.stm_lms_user_float_menu .stm_lms_user_float_menu__tabs {
					border-bottom: 3px solid <?php echo esc_attr( STM_LMS_Helpers::stm_rgba_change_alpha_dynamically( $float_text_color, .2 ) ); ?> !important;
				}

				body .stm_lms_user_float_menu {
					background-color: <?php echo esc_attr( $float_background_color ); ?>;
				}

				body .stm_lms_user_float_menu .float_menu_item:hover {
					background-color: <?php echo esc_attr( STM_LMS_Helpers::stm_rgba_change_alpha_dynamically( $float_text_color, .2 ) ); ?>;
				}

				body .stm_lms_user_float_menu__user {
					border-top: rgb(<?php echo esc_attr( $float_background_color ); ?>, .1);
					border-bottom: rgba(<?php echo esc_attr( $float_background_color ); ?>, '0.1');
				}
			</style>
			<?php
		}

		if ( $is_text_color_default ) {
			?>
			<style>
				.stm_lms_button .stm_lms_user_float_menu__scrolled .stm_lms_user_float_menu__scrolled_label i {
					color: <?php echo esc_attr( STM_LMS_Helpers::stm_rgba_change_alpha_dynamically( $float_background_color, .5 ) ); ?> !important;
				}

				.stm_lms_user_float_menu .float_menu_item_active .stm_lms_user_float_menu__user_settings {
					color: <?php echo esc_attr( $float_text_color ); ?> !important;
				}

				.stm_lms_user_float_menu .stm-lms-logout-button {
					color: <?php echo esc_attr( $float_text_color ); ?> !important;
					border-top: 1px solid <?php echo esc_attr( STM_LMS_Helpers::stm_rgba_change_alpha_dynamically( $float_text_color, .2 ) ); ?> !important;
				}

				.stm_lms_user_float_menu .stm_lms_user_float_menu__user_settings {
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}

				.stm_lms_user_float_menu .stm_lms_user_float_menu__empty {
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}

				.stm_lms_user_float_menu .stm_lms_user_float_menu__login_head h4 {
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}

				.stm_lms_user_float_menu .stm_lms_user_float_menu__login #stm-lms-login .stm_lms_login_wrapper .stm_lms_login_wrapper__actions .lostpassword {
					color: <?php echo esc_attr( $float_text_color ); ?> !important;
				}

				.stm_lms_user_float_menu__login .stm_lms_user_float_menu__login_head a {
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}

				.stm_lms_user_float_menu__login .stm_lms_user_float_menu__login_head a:hover {
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}

				.stm_lms_button .stm_lms_user_float_menu .float_menu_item__divider {
					border-top: 1px solid <?php echo esc_attr( STM_LMS_Helpers::stm_rgba_change_alpha_dynamically( $float_text_color, .15 ) ); ?> !important;
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}

				.stm_lms_button .stm-lms-logout-button:hover i {
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}

				.stm_lms_user_float_menu .stm_lms_user_float_menu__user {
					border-top: 1px solid <?php echo esc_attr( STM_LMS_Helpers::stm_rgba_change_alpha_dynamically( $float_text_color, .15 ) ); ?> !important;
					border-bottom: 1px solid <?php echo esc_attr( STM_LMS_Helpers::stm_rgba_change_alpha_dynamically( $float_text_color, .15 ) ); ?> !important;
				}

				.stm_lms_user_float_menu__toggle svg:hover path {
					fill: <?php echo esc_attr( STM_LMS_Helpers::stm_rgba_change_alpha_dynamically( $float_text_color, 1 ) ); ?> !important;
				}

				.stm_lms_user_float_menu__toggle svg path {
					fill: <?php echo esc_attr( $float_text_color ); ?> !important;
				}

				.stm_lms_button .stm_lms_user_float_menu .float_menu_item:hover .stm_lms_user_float_menu__user_settings, .stm_lms_user_float_menu .float_menu_item_active .stm_lms_user_float_menu__user_settings {
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}

				.stm_lms_button .stm_lms_user_float_menu .float_menu_item:hover .float_menu_item__icon, .stm_lms_user_float_menu .float_menu_item_active .float_menu_item__icon {
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}

				.stm_lms_user_float_menu .stm_lms_user_float_menu__user_info span, .stm_lms_user_float_menu .stm_lms_user_float_menu__user_info h3 {
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}

				.stm_lms_button .stm_lms_user_float_menu .float_menu_item__inline .float_menu_item__icon {
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}

				.stm_lms_button .stm_lms_user_float_menu.__collapsed .stm_lms_user_float_menu__toggle:hover {
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}

				.stm_lms_button .stm_lms_user_float_menu.__collapsed .stm_lms_user_float_menu__toggle:hover svg path {
					fill: <?php echo esc_attr( $float_text_color ); ?>;
				}

				body .stm_lms_user_float_menu .float_menu_item:hover .float_menu_item__title {
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}

				.stm_lms_user_float_menu .float_menu_item__inline .float_menu_item__title {
					color: <?php echo esc_attr( $float_text_color ); ?>;
				}
			</style>
			<?php
		}
	}

	public static function user_menu_float_items( $current_user, $lms_template_current, $object_id ) {
		$settings      = get_option( 'stm_lms_settings', array() );
		$is_instructor = STM_LMS_Instructor::is_instructor( $current_user['id'] );

		$menus = array();

		/*Instructor fields*/
		if ( $is_instructor ) {
			$menus[] = array(
				'order'                => 10,
				'id'                   => 'dashboard',
				'current_user'         => $current_user,
				'lms_template_current' => $lms_template_current,
				'lms_template'         => 'stm-lms-user',
				'menu_title'           => esc_html__( 'Dashboard', 'masterstudy-lms-learning-management-system' ),
				'label'                => esc_html__( 'Dashboard', 'masterstudy-lms-learning-management-system' ),
				'menu_icon'            => 'fa-tachometer-alt',
				'menu_url'             => STM_LMS_User::login_page_url(),
				'is_active'            => ( ! empty( $settings['user_url'] ) ) ? $settings['user_url'] : '',
				'menu_place'           => 'main',
			);

			$menus[] = array(
				'id'    => 'divider',
				'order' => 90,
				'type'  => 'divider',
				'title' => esc_html__( 'Learning area', 'masterstudy-lms-learning-management-system' ),
			);
		}

		$menus[] = array(
			'order'                => 100,
			'id'                   => 'enrolled_courses',
			'current_user'         => $current_user,
			'lms_template_current' => $lms_template_current,
			'lms_template'         => 'stm-lms-user-courses',
			'menu_title'           => esc_html__( 'Enrolled Courses', 'masterstudy-lms-learning-management-system' ),
			'label'                => esc_html__( 'Enrolled Courses', 'masterstudy-lms-learning-management-system' ),
			'menu_icon'            => 'fa-book',
			'menu_url'             => STM_LMS_User::enrolled_courses_url(),
			'is_active'            => ( ! $is_instructor && ( ! empty( $settings['user_url'] && ! empty( $object_id ) && $settings['user_url'] == $object_id ) ) ),
			'menu_place'           => 'learning',
		);

		if ( ! self::float_menu_enabled() ) {
			$menus[] = array(
				'order'                => 110,
				'id'                   => 'settings',
				'current_user'         => $current_user,
				'lms_template_current' => $lms_template_current,
				'lms_template'         => 'stm-lms-user-settings',
				'menu_title'           => esc_html__( 'Settings', 'masterstudy-lms-learning-management-system' ),
				'label'                => esc_html__( 'Settings', 'masterstudy-lms-learning-management-system' ),
				'menu_icon'            => 'fa-cog',
				'menu_url'             => STM_LMS_User::settings_url(),
				'menu_place'           => 'main',
			);
		}

		if ( apply_filters( 'float_menu_item_enabled', true ) ) {
			$menus[] = array(
				'order'                => 120,
				'id'                   => 'messages',
				'current_user'         => $current_user,
				'lms_template_current' => $lms_template_current,
				'lms_template'         => 'stm-lms-user-chats',
				'menu_title'           => esc_html__( 'Messages', 'masterstudy-lms-learning-management-system' ),
				'label'                => esc_html__( 'Messages', 'masterstudy-lms-learning-management-system' ),
				'menu_icon'            => 'fa-envelope',
				'menu_url'             => STM_LMS_Chat::chat_url(),
				'badge_count'          => STM_LMS_Chat::user_new_messages( $current_user['id'] ),
				'menu_place'           => 'learning',
			);
		}

		$menus[] = array(
			'order'                => 130,
			'id'                   => 'favorite_courses',
			'current_user'         => $current_user,
			'lms_template_current' => $lms_template_current,
			'lms_template'         => 'stm-lms-wishlist',
			'menu_title'           => esc_html__( 'Favorite Courses', 'masterstudy-lms-learning-management-system' ),
			'label'                => esc_html__( 'Favorite Courses', 'masterstudy-lms-learning-management-system' ),
			'menu_icon'            => 'fa-star',
			'menu_url'             => STM_LMS_User::wishlist_url(),
			'is_active'            => ( ! empty( $settings['wishlist_url'] ) ) ? $settings['wishlist_url'] : '',
			'menu_place'           => 'learning',
		);
		$menus[] = array(
			'order'                => 140,
			'id'                   => 'enrolled_quizzes',
			'current_user'         => $current_user,
			'lms_template_current' => $lms_template_current,
			'lms_template'         => 'stm-lms-user-quizzes',
			'menu_title'           => esc_html__( 'Enrolled Quizzes', 'masterstudy-lms-learning-management-system' ),
			'label'                => esc_html__( 'Enrolled Quizzes', 'masterstudy-lms-learning-management-system' ),
			'menu_icon'            => 'fa-question',
			'menu_url'             => STM_LMS_User::enrolled_quizzes_url(),
			'menu_place'           => 'learning',
		);
		$menus[] = array(
			'order'                => 150,
			'id'                   => 'my_orders',
			'current_user'         => $current_user,
			'lms_template_current' => $lms_template_current,
			'lms_template'         => 'stm-lms-user-orders',
			'menu_title'           => esc_html__( 'My Orders', 'masterstudy-lms-learning-management-system' ),
			'label'                => esc_html__( 'My Orders', 'masterstudy-lms-learning-management-system' ),
			'menu_icon'            => 'fa-shopping-basket',
			'menu_url'             => STM_LMS_User::my_orders_url(),
			'menu_place'           => 'learning',
		);

		if ( STM_LMS_Subscriptions::subscription_enabled() ) {
			$menus[] = array(
				'order'                => 125,
				'id'                   => 'memberships',
				'current_user'         => $current_user,
				'lms_template_current' => $lms_template_current,
				'lms_template'         => 'stm-lms-user-pmp',
				'menu_title'           => esc_html__( 'Memberships', 'masterstudy-lms-learning-management-system' ),
				'label'                => esc_html__( 'Memberships', 'masterstudy-lms-learning-management-system' ),
				'menu_icon'            => 'fa-address-card',
				'menu_url'             => STM_LMS_User::my_pmpro_url(),
				'menu_place'           => 'learning',
			);
		}

		$menus = apply_filters( 'stm_lms_float_menu_items', $menus, $current_user, $lms_template_current, $object_id );

		array_multisort( array_column( $menus, 'order' ), SORT_ASC, $menus );

		return $menus;
	}

	/**
	 * Displays a sortable menu on the site after filtering it
	 */
	public static function stm_lms_user_menu_display( $current_user, $lms_template_current, $object_id ) {
		$menu_items                  = self::user_menu_float_items( $current_user, $lms_template_current, $object_id );
		$is_instructor               = STM_LMS_Instructor::is_instructor( $current_user['id'] );
		$sorting_menu                = self::get_menu_options( STM_LMS_Options::get_option( 'sorting_the_menu' ) );
		$sorting_float_menu_main     = self::get_menu_options( STM_LMS_Options::get_option( 'sorting_float_menu_main' ) );
		$sorting_float_menu_learning = self::get_menu_options( STM_LMS_Options::get_option( 'sorting_float_menu_learning' ) );
		$sorting_the_menu_student    = self::get_menu_options( STM_LMS_Options::get_option( 'sorting_the_menu_student' ) );

		/* If user is instructor*/
		if ( $is_instructor ) {
			$menu_items = self::remove_settings_from_menu( $menu_items );

			if ( self::float_menu_enabled() ) {
				if ( $sorting_float_menu_main ) {
					foreach ( $menu_items as $menu_item ) {
						if ( isset( $menu_item['id'] ) && 'divider' === $menu_item['id'] ) {
							$divider = $menu_item;
						}
					}

					$menu_items = apply_filters( 'stm_lms_sorted_menu', $sorting_float_menu_main, 'sorting_float_menu_main', $current_user, $lms_template_current, $object_id );

					array_push( $menu_items, $divider );

					$sorting_float_menu_learning = apply_filters( 'stm_lms_sorted_menu', $sorting_float_menu_learning, 'sorting_float_menu_learning', $current_user, $lms_template_current, $object_id );

					$menu_items = array_merge( $menu_items, $sorting_float_menu_learning );
				}
			} else {
				if ( $sorting_menu ) {
					$menu_items = apply_filters( 'stm_lms_sorted_menu', $sorting_menu, 'sorting_the_menu', $current_user, $lms_template_current, $object_id );
				}
			}
		} else {
			/* If float side menu is off*/
			if ( ! self::float_menu_enabled() && $sorting_the_menu_student || ! self::float_menu_enabled() && is_array( $sorting_the_menu_student ) ) {
				$menu_items = apply_filters( 'stm_lms_sorted_menu', $sorting_the_menu_student, 'sorting_the_menu_student', $current_user, $lms_template_current, $object_id );
			}
			/* If float side menu is on*/
			if ( self::float_menu_enabled() && $sorting_float_menu_learning || self::float_menu_enabled() && is_array( $sorting_float_menu_learning ) ) {
				$menu_items = apply_filters( 'stm_lms_sorted_menu', $sorting_float_menu_learning, 'sorting_float_menu_learning', $current_user, $lms_template_current, $object_id );
			}
		}

		return $menu_items;
	}

	/**
	 * Adds activated menu items to the sortable menu. An array of menu items, user data and the menu name are passed to the function
	 */
	public function sorting_menu( $menu_items, $menu, $current_user, $lms_template_current = null, $object_id = null ) {
		$is_instructor = STM_LMS_Instructor::is_instructor( $current_user['id'] );
		$default_menu  = self::user_menu_float_items( $current_user, $lms_template_current, $object_id );

		foreach ( $default_menu as $menu_item ) {
			$add_element = false;

			if ( isset( $menu_item['id'] ) ) {
				if ( ! $this->search_item_in_sortable_menu( $menu_item['id'], $menu ) ) {
					if ( 'sorting_float_menu_learning' === $menu || 'sorting_the_menu_student' === $menu ) {
						switch ( $menu_item['id'] ) {
							case 'settings':
								$add_element = ! $is_instructor && ! self::float_menu_enabled();
								if ( is_admin() ) {
									$add_element = ! self::float_menu_enabled();
								}
								break;
							case 'memberships':
								$add_element = STM_LMS_Subscriptions::subscription_enabled();
								break;
							case 'my_assignments':
								$add_element = class_exists( 'STM_LMS_Assignments' );
								break;
							case 'certificates':
								$add_element = class_exists( 'STM_LMS_Certificate_Builder' );
								break;
							case 'groups':
								$add_element = class_exists( 'STM_LMS_Enterprise_Courses' );
								break;
							case 'my_points':
								$add_element = class_exists( 'STM_LMS_Point_System_Interface' );
								break;
						}
					} elseif ( 'sorting_float_menu_main' === $menu ) {
						switch ( $menu_item['id'] ) {
							case 'add_student':
								$add_element = $is_instructor && STM_LMS_Instructor::instructor_can_add_students();
								break;
							case 'assignments':
								$add_element = $is_instructor && class_exists( 'STM_LMS_Assignments' );
								break;
							case 'add_course':
								$add_element = $is_instructor && class_exists( 'STM_LMS_Manage_Course' );
								break;
							case 'announcement':
								$add_element = $is_instructor && stm_wpcfto_is_pro();
								break;
							case 'bundles':
								$add_element = class_exists( 'STM_LMS_Course_Bundle' );
								break;
							case 'gradebook':
								$add_element = class_exists( 'STM_LMS_The_Gradebook' );
								break;
							case 'payout':
								$add_element = class_exists( 'Stm_Lms_Statistics' ) && ! current_user_can( 'administrator' );
								break;
						}
					} elseif ( 'sorting_the_menu' === $menu ) {
						switch ( $menu_item['id'] ) {
							case 'add_student':
								$add_element = $is_instructor && STM_LMS_Instructor::instructor_can_add_students();
								break;
							case 'assignments':
								$add_element = $is_instructor && class_exists( 'STM_LMS_Assignments' );
								break;
							case 'add_course':
								$add_element = $is_instructor && class_exists( 'STM_LMS_Manage_Course' );
								break;
							case 'announcement':
								$add_element = $is_instructor && stm_wpcfto_is_pro();
								break;
							case 'bundles':
								$add_element = class_exists( 'STM_LMS_Course_Bundle' );
								break;
							case 'gradebook':
								$add_element = class_exists( 'STM_LMS_The_Gradebook' );
								break;
							case 'payout':
								$add_element = class_exists( 'Stm_Lms_Statistics' ) && ! current_user_can( 'administrator' );
								break;
							case 'memberships':
								$add_element = STM_LMS_Subscriptions::subscription_enabled();
								break;
							case 'my_assignments':
								$add_element = class_exists( 'STM_LMS_Assignments' );
								break;
							case 'certificates':
								$add_element = class_exists( 'STM_LMS_Certificate_Builder' );
								break;
							case 'groups':
								$add_element = class_exists( 'STM_LMS_Enterprise_Courses' );
								break;
							case 'my_points':
								$add_element = class_exists( 'STM_LMS_Point_System_Interface' );
								break;
						}
					}
				}

				if ( $add_element ) {
					array_push( $menu_items, $menu_item );
				}
			}
		}

		return apply_filters( 'stm_lms_sorted_menu_filter_elements', $menu_items, $current_user );
	}

	public static function remove_settings_from_menu( $menu_items ) {
		$actual_menu = array();
		foreach ( $menu_items as $menu_item ) {
			if ( isset( $menu_item['id'] ) ) {
				$add_element = true;
				switch ( $menu_item['id'] ) {
					case 'settings':
						$add_element = ! STM_LMS_Instructor::is_instructor( get_current_user_id() );
						break;
				}
			}
			if ( $add_element ) {
				array_push( $actual_menu, $menu_item );
			}
		}
		return $actual_menu;
	}

	/**
	 * Removes inactive menu items from the sortable menu. An array of menu items and user data are passed to the function
	 */
	public function sorted_menu_filter_elements( $menu_items, $current_user ) {
		$is_instructor = STM_LMS_Instructor::is_instructor( get_current_user_id() );
		$actual_menu   = array();

		if ( ! $is_instructor ) {
			$menu_items = apply_filters( 'stm_lms_sorted_student_menu', $menu_items );
		}

		foreach ( $menu_items as $menu_item ) {
			if ( isset( $menu_item['id'] ) ) {
				$add_element = true;

				switch ( $menu_item['id'] ) {
					case 'memberships':
						$add_element = STM_LMS_Subscriptions::subscription_enabled();
						break;
					case 'add_student':
						$add_element = STM_LMS_Instructor::instructor_can_add_students();
						break;
					case 'assignments':
						$add_element = class_exists( 'STM_LMS_Assignments' );
						if ( $add_element ) {
							$menu_item['badge_count'] = STM_LMS_Instructor_Assignments::total_pending_assignments( $current_user );
						}
						break;
					case 'my_assignments':
						$add_element = class_exists( 'STM_LMS_Assignments' );
						if ( $add_element ) {
							$menu_item['badge_count'] = STM_LMS_User_Assignment::my_assignments_statuses( $current_user );
						}
						break;
					case 'certificates':
						$add_element = class_exists( 'STM_LMS_Certificate_Builder' );
						break;
					case 'bundles':
						$add_element = class_exists( 'STM_LMS_Course_Bundle' );
						break;
					case 'groups':
						$add_element = class_exists( 'STM_LMS_Enterprise_Courses' );
						break;
					case 'gradebook':
						$add_element = class_exists( 'STM_LMS_The_Gradebook' );
						break;
					case 'my_points':
						$add_element = class_exists( 'STM_LMS_Point_System_Interface' );
						if ( $add_element ) {
							$menu_item['badge_count'] = count( stm_lms_get_incompleted_user_points( $current_user['id'] ) );
						}
						break;
					case 'messages':
						$menu_item['badge_count'] = STM_LMS_Chat::user_new_messages( $current_user['id'] );
						break;
					case 'payout':
						$add_element = class_exists( 'Stm_Lms_Statistics' );
						if ( ! is_admin() ) {
							$add_element = class_exists( 'Stm_Lms_Statistics' ) && ! current_user_can( 'administrator' );
						}
						break;
					case 'add_course':
						$add_element = class_exists( 'STM_LMS_Manage_Course' );
						break;
					case 'announcement':
						$add_element = stm_wpcfto_is_pro();
						break;
				}

				if ( $add_element ) {
					array_push( $actual_menu, $menu_item );
				}
			}
		}

		return $actual_menu;
	}

	/**
	 * Removes menu items that should not be shown to the student
	 */
	public function sorting_student_menu( $menu_items ) {
		$actual_menu = array();
		foreach ( $menu_items as $menu_item ) {
			if ( isset( $menu_item['id'] ) ) {
				$add_element = true;

				switch ( $menu_item['id'] ) {
					case 'dashboard':
						$add_element = false;
						break;
					case 'divider':
						$add_element = false;
						break;
					case 'settings':
						$add_element = ! self::float_menu_enabled();
						break;
					case 'gradebook':
						$add_element = false;
						break;
					case 'assignments':
						$add_element = false;
						break;
					case 'bundles':
						$add_element = false;
						break;
					case 'add_course':
						$add_element = false;
						break;
					case 'add_student':
						$add_element = false;
						break;
					case 'payout':
						$add_element = false;
						break;
					case 'announcement':
						$add_element = false;
						break;
				}

				if ( $add_element ) {
					array_push( $actual_menu, $menu_item );
				}
			}
		}
		return $actual_menu;
	}

	public function search_item_in_sortable_menu( $menu_item, $menu_name ) {
		$option = get_option( 'stm_lms_settings', array() );

		if ( $option[ $menu_name ] ) {
			foreach ( $option[ $menu_name ] as $key ) {
				foreach ( $key['options'] as $item ) {
					if ( array_search( $menu_item, $item, true ) ) {
						return true;
					}
				}
			}
		}

		return false;
	}

	public function filter_saving_values( $settings_data ) {
		$menu_items = array(
			'sorting_float_menu_main',
			'sorting_float_menu_learning',
			'sorting_the_menu',
			'sorting_the_menu_student',
		);

		foreach ( $menu_items as $menu_item ) {
			if ( ! empty( $settings_data[ $menu_item ] ) ) {
				$settings_data[ $menu_item ][0]['options'] = apply_filters( 'stm_lms_sorted_menu', $settings_data[ $menu_item ][0]['options'], $menu_item, null, null, null );
				$settings_data[ $menu_item ][1]['options'] = apply_filters( 'stm_lms_sorted_menu_filter_elements', $settings_data[ $menu_item ][1]['options'], null );
			}
		}

		return $settings_data;
	}

	public static function get_menu_options( $menu ) {
		return isset( $menu[0]['options'] ) ? $menu[0]['options'] : false;
	}
}
