<?php
/**
 * @file
 * Blank_Module module configuration form
 */

/**
 * Page callback: Blank_Module settings
 * @see: blank_module_menu()
 */

function blank_module_form($form, &$form_state) {
  $form['blank_module_setting1'] = array(
    '#type' => 'textfield',
    '#title' => t('blank_module Setting 1'),
    '#default_value' => variable_get('blank_module_setting1', 2),
    '#size' => 2,
    '#description' => t('Setting decription'),
    '#required' => TRUE,
  );
  return system_settings_form($form);
}

/**
 * Implements validation from the Form API
 *
 * @param form
 *  A structured array containing the elements and properties of the form.
 * @param $form_state
 *  An array that contains information about the form's current state during
 *  processing
 */

function blank_module_form_validate($form, &$form_state) {
  $valueCheck = $form_state['values']['blank_module_setting1'];
  if($valueCheck <= 0) {
    form_set_error('blank_module_setting1', t('Value must be greater than zero'));
  }
}
