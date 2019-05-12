<?php

namespace App\Router;

use Nette\Application\Routers\RouteList;
use Nette\Application\Routers\Route;


class RouterFactory
{
    /**
     * @return \Nette\Application\IRouter
     */
    public function createRouter()
    {
        $router = new RouteList;
        $router[] = new Route('administrace[/<presenter>[/<action>[/<id>]]]', [
            'module' => 'Admin',
            'presenter' => 'Uvod',
            'action' => 'default',
            'id' => NULL
        ]);

        $router[] = new Route('[<lang [a-z]{2}>/]<presenter>/<action>[/<id>]', [
            'module' => 'Front',
            'presenter' => 'Homepage',
            'action' => 'default',
            'lang' => 'cz',
            'id' => NULL
        ]);
        return $router;
    }
}
