<?php
/**
 * Created by PhpStorm.
 * User: netrh
 * Date: 26.02.2019
 * Time: 19:44
 */

namespace App\Model\Services;


use App\Model\Entities\Language;
use App\Model\Entities\Mutation;

abstract class BaseService
{


    public function findByVar($var, $val) {
        return $this->entities->findOneBy(array($var => $val));
    }

    public function findById($val) {
        return $this->entities->findOneBy(array('id' => $val));
    }

    public function getEntities($all = false) {
        if($all) {
            return $this->entities->findAll();
        }
        $sql = 'SELECT m FROM '.Mutation::class.' m WHERE m.deprecated = 0';
        $query = $this->entityManager->createQuery($sql);
        $data = $query->getResult();
        return $data;
    }
}