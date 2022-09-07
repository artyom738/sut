<?php

require_once './Autoloader.php';
const SOURCE_DIR = __DIR__ . '/';

$autoloader = Autoloader::getInstance();
$autoloader->addVendorNamespacePath('Sut\\', SOURCE_DIR);

$database = Sut\Database::getInstance();
$updater = new Sut\Updater($database);

$version = $updater->updateDb();
echo $version;