<?php
$email = [
    'register_from_email' => 'no-reply@dagt.io',
];
$language = require(__DIR__ . '/language.php');
$country = require(__DIR__ . '/country.php');
return array_merge($email, $language, $country);