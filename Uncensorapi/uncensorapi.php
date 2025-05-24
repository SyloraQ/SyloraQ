<?php
$url = 'https://goodbyesyntax-uncensorapi.glitch.me/uncensor';
$data = json_encode(["text" => "Th1s 1s @ test"]);

$options = [
    'http' => [
        'header'  => "Content-Type: application/json\r\n",
        'method'  => 'POST',
        'content' => $data,
    ],
];

$context = stream_context_create($options);
$result = file_get_contents($url, false, $context);

if ($result !== FALSE) {
    $response = json_decode($result, true);
    echo $response['uncensored'];
}
?>
