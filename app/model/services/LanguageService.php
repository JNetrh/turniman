<?php
/**
 * Created by PhpStorm.
 * User: Kuba
 * Date: 28.3.2018
 * Time: 19:14
 */
namespace App\Model\Services;

use App\Model\Entities\Language;
use Kdyby\Doctrine\EntityManager;

class LanguageService extends BaseService
{

    /**
     * @var EntityManager
     */
    private $entityManager;

    /**
     * @var EntityManager
     */
    public $entities;

    public function __construct(EntityManager $entityManager)
    {
        $this->entityManager = $entityManager;
        $this->entities = $this->entityManager->getRepository(Language::class);
    }

    public function newEntity(){
        $entity = new Language();
        return $entity;
    }

    public function saveEntity($entity){
        $this->entityManager->persist($entity);
        $this->entityManager->flush();
    }


    public function delete($id){
        $toDel = $this->findById($id);
        $this->entityManager->remove($toDel);
        $this->entityManager->flush();
    }


    public function findByLang($val) {
        return $this->entities->findOneBy(array('code' => $val));
    }

    public function getAllLanguages($all = false) {
        if($all) {
            return $this->entities->findAll();
        }
        $sql = 'SELECT l FROM '.Language::class.' l WHERE l.display = 1';
        $query = $this->entityManager->createQuery($sql);
        $data = $query->getResult();
        return $data;


    }

   

}