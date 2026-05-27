<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "products".
 *
 * @property int $id ID
 * @property int $category_id Categoría
 * @property string $name Nombre
 * @property string $description Descripción
 * @property float $price Precio
 * @property string|null $image Imagen
 * @property int $active Activo
 * @property string $sku SKU
 * @property float $preparation_time_minutes Tiempo en minutos
 * @property string $created Creado
 * @property string $created_by Creado por
 * @property string $modified Modificado
 * @property string $modified_by Modificado por
 *
 * @property Categories $category
 */
class Products extends BeforeModel
{


    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'products';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['image'], 'default', 'value' => null],
            [['category_id', 'name', 'description', 'price', 'active', 'sku', 'preparation_time_minutes'], 'required'],
            [['category_id', 'active'], 'integer'],
            [['description'], 'string'],
            [['price', 'preparation_time_minutes'], 'number'],
            [['created', 'modified'], 'safe'],
            [['name', 'image'], 'string', 'max' => 100],
            [['sku'], 'string', 'max' => 20],
            [['created_by', 'modified_by'], 'string', 'max' => 50],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => Categories::class, 'targetAttribute' => ['category_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'category_id' => 'Categoría',
            'name' => 'Nombre',
            'description' => 'Descripción',
            'price' => 'Precio',
            'image' => 'Imagen',
            'active' => 'Activo',
            'sku' => 'SKU',
            'preparation_time_minutes' => 'Tiempo en minutos',
            'created' => 'Creado',
            'created_by' => 'Creado por',
            'modified' => 'Modificado',
            'modified_by' => 'Modificado por',
        ];
    }

    /**
     * Gets query for [[Category]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Categories::class, ['id' => 'category_id']);
    }

}
