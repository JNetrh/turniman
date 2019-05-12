<?php

namespace App\FrontModule\Presenters;

use Nette;
use Nette\Application\UI\Form;
use Nette\Utils\Json;
use Nette\Application\Responses\JsonResponse;
use App\Model\HelperFunctions;

abstract class BasePresenter extends Nette\Application\UI\Presenter
{
    /** @persistent */
    public $lang;

    /** @var \App\Model\Services\MutationService @inject */
    public $mutationService;

    /** @var \App\Model\Services\LanguageService @inject */
    public $languageService;

    public function startup() {
        if(!$this->lang) {
            $this->lang = 'cz';
        }
        parent::startup();
    }

    protected function beforeRender() {


        $this->template->lang = $this->lang;
        $this->template->allLanguages = $this->languageService->getAllLanguages();
        $this->template->helperFunctions =  new HelperFunctions();

    }


    public function handleChangeLang($lang)
    {
        $this->lang = $lang;

    }



    public function handleSubmitLanguage ($data) {
        if($this->getUser()->isLoggedIn()) {
            $parsedData = Json::decode($data);
            $mutation = $this->mutationService->findByLang($parsedData->lang);

            $pathArray = explode('/', $parsedData->path);

            $data = $this->findAndReplace($mutation->getContent(), $pathArray, $parsedData->content);
            $mutation->setContent(json_encode($data));
            $this->mutationService->saveEntity($mutation);

            $this->sendResponse(new JsonResponse(['success' => 'true']));
        }
        else {
            $this->sendResponse(new JsonResponse(['success' => 'false']));
        }

    }

    public function findAndReplace ($obj, $path, $data) {
        $objArr = json_decode($obj, true);
        bdump($objArr, 'onjArr');
        return $this->findAndReplaceAndDo($objArr, $path, $data);
    }


    public function findAndReplaceAndDo ($obj, $path, $data, $index = 0) {
        if($index + 1 == sizeof($path)) {
            if(!is_array($obj)) {
                $obj = json_decode(json_encode($obj), true);
            }
            $obj[$path[$index]] = $data;
            return $obj;
        }
        $obj[$path[$index]] = $this->findAndReplaceAndDo($obj[$path[$index]], $path, $data, $index + 1);

        return $obj;
    }



    protected function createComponentContactForm(){
        $form = new Form;
        $form->addText('name')->setRequired();
        $form->addEmail('email')->setRequired();
        $form->addText('subject')->setRequired();
        $form->addTextArea('message')->setRequired();
        $form->addSubmit('send');

        $this->template->contactForm = $form;

        $form->onSuccess[] = [$this, 'ContactFormSucceeded'];

        return $form;
    }


    public function ContactFormSucceeded($form){
        $values = $form->getValues();//získání hodnot z formuláře

        bdump($values);

        $this->redirect('Homepage:');
    }
}
