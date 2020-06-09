<?php
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    $_SERVER['HTTPS'] = 'on';
    $_SERVER['SERVER_PORT'] = '443';
}

$container = require __DIR__ . '/../app/bootstrap.php';

$container->getByType(Nette\Application\Application::class)
	->run();
