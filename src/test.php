<?php

$confActualMtime = filemtime('InitialiseSettings.php');

$cache = '/tmp/cache.json';
$globals = json_decode(@file_get_contents($cache), true);

# If the cache has an older mtime, it's invalid
if ( isset( $globals['timestamp'] ) && $globals['timestamp'] !== $confActualMtime ) {
	$globals = [];
}

if ( ! $globals ) {
	require_once "InitialiseSettings.php";

	$globals = [
		"timestamp" => $confActualMtime,
		"foo" => $foo,
	];

	file_put_contents($cache, json_encode($globals));
}

echo $globals['foo'];
