<?php
/**
 * Created by PhpStorm.
 * User: Kuba
 * Date: 28.3.2018
 * Time: 19:14
 */
namespace App\Model\Services;

use App\Model\Entities\Mutation;
use App\Model\Services\LanguageService;
use Kdyby\Doctrine\EntityManager;

class MutationService extends BaseService
{

    /**
     * @var EntityManager
     */
    private $entityManager;

    /**
     * @var EntityManager
     */
    public $entities;
    public $languageService;

    public function __construct(EntityManager $entityManager, LanguageService $languageService)
    {
        $this->entityManager = $entityManager;
        $this->entities = $this->entityManager->getRepository(Mutation::class);
        $this->languageService = $languageService;
    }

    public function newEntity(){
        $entity = new Mutation();
        return $entity;
    }

    public function saveEntity($entity){
        $this->entityManager->persist($entity);
        $this->entityManager->flush();
    }


    public function delete($id){
        $toDel = $this->findById($id);
        bdump($toDel);
        $this->entityManager->remove($toDel);
        $this->entityManager->flush();
        $this->languageService->delete($toDel->getLangId());
    }


    public function findByLang($val) {
        $languageEntity = $this->languageService->findByLang($val);
        if(!$languageEntity) {
            $languageEntity = $this->languageService->findByLang('xx');
        }
        return $this->entities->findOneBy(array('lang_id' => $languageEntity->getId()));
    }



}