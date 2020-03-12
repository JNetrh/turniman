<?php
/**
 * Created by PhpStorm.
 * User: Kuba
 * Date: 03.04.2019
 * Time: 12:07
 */

namespace App\Model\Entities;

use Doctrine\ORM\Mapping as ORM;
use App\Model\Entities\Language;
use Kdyby\Doctrine\Entities\Attributes\Identifier;

/**
 * Doctrine entita
 * @package App\Model\Entities
 * @ORM\Entity
 * @ORM\Table(name="mutations")
 */
class Mutation
{


    use Identifier;



    /**
     * id of the language used
     * @ORM\Column(type="integer")
     */
    private $lang_id;


    /**
     * stringified content of the web in JSON representing the language
     * @ORM\Column(type="string")
     */
    private $content;

    /**
     * last updated
     * @ORM\Column(type="datetime")
     */
    private $lastUpdate;

    /**
     * if this particular lang mutation is deprecated or not
     * @ORM\Column(type="integer")
     */
    private $deprecated;






    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getLangId()
    {
        return $this->lang_id;
    }

    /**
     * @param mixed $langId
     */
    public function setLangId($langId)
    {
        $this->lang_id = $langId;
    }

    /**
     * @return mixed
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * @param mixed $content
     */
    public function setContent($content)
    {
        $this->content = $content;
    }

    /**
     * @return mixed
     */
    public function getLastUpdate()
    {
        return $this->lastUpdate;
    }

    /**
     * @return mixed
     */
    public function getDeprecated()
    {
        return $this->deprecated;
    }

    /**
     * @param mixed $deprecated
     */
    public function setDeprecated($deprecated)
    {
        $this->deprecated = $deprecated;
    }




}