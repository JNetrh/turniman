<?php

namespace App\AdminModule\Presenters;

use Nette;
use Nette\Application\UI\Form;
use App\Model\Services\LanguageService;

class LanguagePresenter extends SecuredBasePresenter {

    public $service;

    public function __construct(LanguageService $service)
    {
        $this->service = $service;
    }


    public function renderDefault() {
        $this->template->flags = $this->service->getEntities();
    }

    public function renderSubmitLanguage($data) {
        $this->handleSubmitLanguage($data);
    }



    public function createComponentNewLanguageForm(){
        $form = new Form;
        $form -> addText('check');
        $form->addSubmit('submit', 'Add language support');
        $this->template->newLanguageForm = $form;
        $form->onSuccess[] = [$this, 'newLanguageFormSucceeded'];
        return $form;
    }

    public function newLanguageFormSucceeded($form, $values) {
        $data = $form->getHttpData();
        bdump($data);

    }



}