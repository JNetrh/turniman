<?php
/**
 * Created by PhpStorm.
 * User: netrh
 * Date: 26.02.2019
 * Time: 19:44
 */

namespace App\Model\Services;


abstract class BaseService
{


    public function findByVar($var, $val) {
        return $this->entities->findOneBy(array($var => $val));
    }

    public function findById($val) {
        return $this->entities->findOneBy(array('id' => $val));
    }

    public function getEntities() {
        return $this->entities->findAll();
    }
}