"use strict";

(function ($) {
  $(document).ready(function () {
    $(document).on('click', '[data-submenu="section_4_profile-menu-reordering"]', function () {
      $('.button_list_box:first-child a').trigger('click');

      if ($('#section_4-float_menu').is(':checked')) {
        $('[data-field="wpcfto_addon_option_sorting_the_menu_student"]').addClass('hidden');
        $('[data-field="wpcfto_addon_option_sorting_the_menu"]').addClass('hidden');
      } else {
        $('[data-field="wpcfto_addon_option_sorting_float_menu_main"]').addClass('hidden');
        $('[data-field="wpcfto_addon_option_sorting_float_menu_learning"]').addClass('hidden');
      }

      $("[data-id='dashboard']").removeClass('list-group-item').addClass('list-group-item-disabled');
      add_notice();
    });
    $(document).on('change', '.list-group', function () {
      setTimeout(add_notice, 500);
    });

    function add_notice() {
      var menu_elements = ["[data-id='dashboard']", "[data-id='assignments']", "[data-id='enrolled_courses']", "[data-id='bundles']", "[data-id='my_orders']"];
      menu_elements.forEach(function (element) {
        if (element === "[data-id='dashboard']") {
          $(element).each(function () {
            if ($(this).find('i').length < 1) {
              $(this).append('<i class="fa fa-lock"></i>');
            }
          });
        } else {
          $(element).each(function () {
            if ($(this).find('i').length < 1) {
              $(this).append('<i class="fa fa-exclamation-triangle"></i>');
            }
          });
        }
      });
    }

    $(document).on('click', '.button_list_box a', function (event) {
      event.preventDefault();
      $(this).addClass('active');
      $(this).parent().siblings().find('a').removeClass('active');

      if ($(this).parent().is(':first-child')) {
        if ($('#section_4-float_menu').is(':checked')) {
          $('[data-field="wpcfto_addon_option_sorting_float_menu_main"]').removeClass('hidden');
          $('[data-field="wpcfto_addon_option_sorting_float_menu_learning"]').addClass('hidden');
        } else {
          $('[data-field="wpcfto_addon_option_sorting_the_menu_student"]').addClass('hidden');
          $('[data-field="wpcfto_addon_option_sorting_the_menu"]').removeClass('hidden');
        }
      } else {
        if ($('#section_4-float_menu').is(':checked')) {
          $('[data-field="wpcfto_addon_option_sorting_float_menu_main"]').addClass('hidden');
          $('[data-field="wpcfto_addon_option_sorting_float_menu_learning"]').removeClass('hidden');
        } else {
          $('[data-field="wpcfto_addon_option_sorting_the_menu_student"]').removeClass('hidden');
          $('[data-field="wpcfto_addon_option_sorting_the_menu"]').addClass('hidden');
        }
      }
    });
  });
})(jQuery);