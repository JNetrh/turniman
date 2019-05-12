<?php
/**
 * Created by PhpStorm.
 * User: netrh
 * Date: 03.04.2019
 * Time: 23:49
 */

namespace App\Model;


class HelperFunctions
{


    public function getPath ( $obj, $key, $arrayPos = null)    {
        $arr = json_decode(json_encode($obj), true);
        $path = substr($this->findPath($arr, $key)[0],1);
        if($arrayPos != null) {
            $path = $path."/".$arrayPos;
        }
        return $path;
    }

    private function findPath  ( $obj, $key, $path = '' )    {
        $list = [];
        foreach ( $obj as $itemKey => $item )   {
            // Check if it's a field I'm interested in (force to string in case of a number)

            if ( (string)$itemKey == $key ) {
                // Add the matched item
                $list[] = $path."/".$itemKey;
            }
            if ( is_array($item) )  {
                // Recall this function again for next level of data, merge in the results
                $list = array_merge($list, $this->findPath($item, $key, $path."/".$itemKey));
            }
        }
        // Pass up results
        return $list;
    }
}