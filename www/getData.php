<?php

$count = $_GET['count'];
$x = $_GET['x'];
$step = $_GET['step'];

$data = array();

for ($i = 0; $i < $count; $i++) {
	$data[] = array(
		'x' => $x++,
		'y' => sin(deg2rad($x))
	);
	$x-=$step;
}

header('Content-Type: application/json');
echo json_encode(array_reverse($data), JSON_NUMERIC_CHECK);

