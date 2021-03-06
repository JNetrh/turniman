<?php
/**
 * Created by PhpStorm.
 * User: Kuba
 * Date: 18.3.2018
 * Time: 19:14
 */
namespace App\Model\Services;

use App\Model\Entities\User as User;
use Kdyby\Doctrine\EntityManager;
use Nette\Security as NS;

class UserService extends BaseService
{

    /**
     * @var EntityManager
     */
    private $entityManager;
    public $entities;

    public function __construct(EntityManager $entityManager)
    {
        $this->entities = $entityManager->getRepository(User::class);
	    $this->entityManager = $entityManager;
    }

    public function createEntity($email, $password) {
        $entity = new User;
        $entity->setEmail($email);
        $entity->setPassword($password);
        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        return $entity;
    }

    public function saveEntity($entity) {
    	$this->entityManager->persist($entity);
    	$this->entityManager->flush();
    }

    public function findByEmail($email)
    {
        return $this->entities->findOneBy(array('email' => $email));
    }

	public function getUsersCount(){
		return count($this->getAll());
	}

	public function changePassword($id, $old, $new){
		$entity = $this->findById($id);
		if (NS\Passwords::verify($old, $entity->getPassword())) {
			$entity->setPassword($new);
			$this->saveEntity($entity);
			return true;
		}
		else{
			return false;
		}
	}

	public function hashPassword($password){
		return password_hash($password, PASSWORD_DEFAULT);
	}



	public function getUsersOffset($length, $from){
		$all = $this->getAll();
		$result = array();

		for ($i = $from; $i <= $length; $i++) {
			if($i < count($all))
				$result[] = $all[$i];
		}
		return $result;
	}

	public function verifyPassword($userId, $password) {
		$entity = $this->findById($userId);
		$password_old = $entity->getPassword();
		if (NS\Passwords::verify($password, $password_old)) {
			return true;
		}
		return false;
	}



	public function randomPassword() {
		$alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
		$pass = array(); //remember to declare $pass as an array
		$alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
		for ($i = 0; $i < 8; $i++) {
			$n = rand(0, $alphaLength);
			$pass[] = $alphabet[$n];
		}
		return implode($pass); //turn the array into a string
	}

}
























