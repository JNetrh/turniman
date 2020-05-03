<?php

namespace App\FrontModule\Presenters;

use Nette;
use Nette\Application\UI\Form;
use Nette\Utils\Json;
use Nette\Application\Responses\JsonResponse;
use App\Model\HelperFunctions;
use Nette\Mail\SendmailMailer;
use Latte\Engine;
use Nette\Mail\Message;


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
            $this->lang = 'cz'; // If no lang given, set default lang -> cz
        }
        $allLangs = $this->languageService->getAllLanguages(); // all available languages
        $isLang = false;
        // If received language not found, set default lang -> cz
        foreach ($allLangs as $language) {
            if($language->getCode() == $this->lang) {
                $isLang = true;
            }
        }
        !$isLang ? $this->lang = 'cz' : $this->lang = $this->lang;
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
        $this->redirect('Homepage:');
    }


    public function handleDeleteLang($lang) {
        $mutation = $this->mutationService->findByLang($lang);
        $this->mutationService->delete($mutation->getId());
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
        $latte = new Engine;
        $params = [
            'email' => $values->email,
            'name' => $values->name,
            'subject' => $values->subject,
            'message' => $values->message,
        ];

        $mail = new Message;
        $mail->setFrom($values->name.' <'.$values->email.'>')
            ->addTo('netrh.j@gmail.com')
            ->setHtmlBody($latte->renderToString('templates/email.latte', $params));



        $mailer = new SendmailMailer;
        $mailer->send($mail);

        $this->redirect('Homepage:');
    }



    /**
     * @return array of languages that has not a translation yet according to the Db
     */
    private function getLanguages() {
        $allLangs = $this->languageService->getAllLanguages(); // all available languages
        $langCodeListSimple = ['cz', 'de', 'en', 'fr', 'it', 'ru', 'sk', 'sp']; // languages with available flags (www/img/flags/<countryCode>.png
        $langCodeListNames = ['Čeština', 'Deutsch', 'English', 'Français', 'Italiano', 'Russkij', 'Slovenština', 'Español']; // languages with available flags (www/img/flags/<countryCode>.png
        $langsToDisplay = array();
        foreach ($langCodeListSimple as $lang){
            $langsToDisplay[$lang] = $lang;
        }
        foreach ($allLangs as $lang) {
            $langToDel = $lang->getCode();
            unset($langsToDisplay[$langToDel]);
        }
        return $langsToDisplay;
    }

    public function actionLogout() {
        $this->getUser()->logout();
        $this->redirect(":Front:Homepage:");
        exit;
    }
}
