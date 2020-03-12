<?php

namespace App\FrontModule\Presenters;

use Nette;
use App\Model\Services\MutationService;
use Nette\Utils\Json;


class HomepagePresenter  extends BasePresenter
{
    public $mutationService;

    public function __construct(MutationService $mutationService)
    {
        $this->mutationService = $mutationService;
    }

    public function renderDefault(){
        $mutation =$this->mutationService->findByLang($this->lang);
        $data = Json::decode($mutation->getContent());
        $this->template->data = $data;
        $this->template->lang = $this->lang;
        bdump($mutation->getContent());
    }
}
