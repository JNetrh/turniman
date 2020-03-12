<?php

namespace App\AdminModule\Presenters;

use Nette;
use App\Model\Services\UserService;


/**
 * Base presenter for all application presenters.
 */
abstract class SecuredBasePresenter extends Nette\Application\UI\Presenter
{
    private $userService;

    public function __construct(UserService $userService) {
        $this->userService = $userService;
    }


	public function startup()
    {
        parent::startup();

        if($this->user){
            if(!$this->getUser()->isLoggedIn()){
                $this->redirect('Sign:in');
            }
            else {
                $this->redirect(":Front:Homepage:");
            }
        }
        else{
            $this->redirect('Sign:in');
        }
    }
    public function actionLogout()
    {
        $this->getUser()->logout();
        $this->flashMessage('Byl/a jste odhlášen.');
        $this->redirect(":Front:Homepage:");
    }

    public function afterRender()
    {
        if ($this->isAjax() && $this->hasFlashSession()) {
            $this->redrawControl('flashes');
        }
    }

}
