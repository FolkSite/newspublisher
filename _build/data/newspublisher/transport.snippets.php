<?php
/**
 * snippets transport file for NewsPublisher extra
 *
 * Copyright 2013-2017 by Bob Ray <http://bobsguides.com>
 * Created on 07-11-2014
 *
 * @package newspublisher
 * @subpackage build
 */

if (! function_exists('stripPhpTags')) {
    function stripPhpTags($filename) {
        $o = file_get_contents($filename);
        $o = str_replace('<' . '?' . 'php', '', $o);
        $o = str_replace('?>', '', $o);
        $o = trim($o);
        return $o;
    }
}
/* @var $modx modX */
/* @var $sources array */
/* @var xPDOObject[] $snippets */


$snippets = array();

$snippets[1] = $modx->newObject('modSnippet');
$snippets[1]->fromArray(array (
  'id' => 1,
  'property_preprocess' => false,
  'name' => 'NewsPublisher',
  'description' => 'Front-end resource creation/editing snippet.',
), '', true, true);
$snippets[1]->setContent(file_get_contents($sources['source_core'] . '/elements/snippets/newspublisher.snippet.php'));


$properties = include $sources['data'].'properties/properties.newspublisher.snippet.php';
$snippets[1]->setProperties($properties);
unset($properties);

$snippets[2] = $modx->newObject('modSnippet');
$snippets[2]->fromArray(array (
  'id' => 2,
  'property_preprocess' => false,
  'name' => 'NpEditThisButton',
  'description' => 'Displays a button to edit the current resource with NewsPublisher.',
), '', true, true);
$snippets[2]->setContent(file_get_contents($sources['source_core'] . '/elements/snippets/npeditthisbutton.snippet.php'));


$properties = include $sources['data'].'properties/properties.npeditthisbutton.snippet.php';
$snippets[2]->setProperties($properties);
unset($properties);

$snippets[3] = $modx->newObject('modSnippet');
$snippets[3]->fromArray(array (
  'id' => 3,
  'property_preprocess' => false,
  'name' => 'npElFinderConnector',
  'description' => 'Runs from a tag on the npElFinderConnector resource.',
  'properties' => 
  array (
  ),
), '', true, true);
$snippets[3]->setContent(file_get_contents($sources['source_core'] . '/elements/snippets/npelfinderconnector.snippet.php'));

$snippets[4] = $modx->newObject('modSnippet');
$snippets[4]->fromArray(array (
  'id' => 4,
  'property_preprocess' => false,
  'name' => 'npElFinderContent',
  'description' => '',
  'properties' => 
  array (
  ),
), '', true, true);
$snippets[4]->setContent(file_get_contents($sources['source_core'] . '/elements/snippets/npelfindercontent.snippet.php'));

return $snippets;
