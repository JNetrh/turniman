<?php

namespace App\Model;

use Nette;
use Nette\Security as NS;
use App\Model\Entities\User as UserEntity;
use App\Model\Services\UserService;



class Authenticator implements NS\IAuthenticator
{

	public $userService;



	/** @var UserEntity Entita pro aktuálního uživatele. */
	protected $userEntity;




	function __construct(UserService $userService)
	{
		$this->userService = $userService;
	}

	function authenticate(array $credentials)
	{
		list($email, $password) = $credentials;


		$row = $this->userService->findByEmail($email);


		if ($row == null) {
			throw new NS\AuthenticationException('špatný email.');
		}

		if (!NS\Passwords::verify($password, $row->getPassword())) {
			throw new NS\AuthenticationException('špatné heslo.');
		}





		return new NS\Identity($row->getId(), ['email' => $row->getEmail()]);
	}


}