<?php

namespace app\models;

use yii\base\Model;

class SoupOption extends Model
{
    public $name;
    public $description;
    public $extra_price;

    public function rules()
    {
        return [
            [['name'], 'required'],
            [['description'], 'string'],
            [['extra_price'], 'number'],
        ];
    }
}