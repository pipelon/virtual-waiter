<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "executive_menus".
 *
 * @property int $id ID
 * @property string $day_of_week Día de la semana en que aplica el menú
 * @property string|null $special_name Nombre de la especialidad del día, ejemplo: (Ajiaco, frijoles, mondongo)
 * @property string|null $special_description Descripción detallada de la especialidad del día para IA y clientes
 * @property string|null $soup_options_json Opciones de sopa disponibles en formato JSON
 * @property string|null $protein_options_json Opciones de proteína disponibles en formato JSON
 * @property string|null $carb_options_json Opciones de carbohidrato disponibles en formato JSON
 * @property string|null $drink_options_json Opciones de bebidas disponibles en formato JSON
 * @property string|null $salad_options_json Opciones de ensalada disponibles en formato JSON
 * @property string|null $additional_notes Notas adicionales visibles para clientes o IA
 * @property float $price Precio base del menú ejecutivo
 * @property int $active Indica si el menú está activo
 * @property string $created Creado
 * @property string $created_by Fecha de última actualización
 * @property string $modified Modificado
 * @property string $modified_by Fecha de última actualización
 */
class ExecutiveMenus extends BeforeModel {

    /**
     * ENUM field values
     */
    const DAY_OF_WEEK_LUNES = 'lunes';
    const DAY_OF_WEEK_MARTES = 'martes';
    const DAY_OF_WEEK_MIERCOLES = 'miércoles';
    const DAY_OF_WEEK_JUEVES = 'jueves';
    const DAY_OF_WEEK_VIERNES = 'viernes';
    const DAY_OF_WEEK_SABADO = 'sábado';
    const DAY_OF_WEEK_DOMINGO = 'domingo';

    public $soups = [];
    public $proteins = [];
    public $drinks = [];
    public $carbs = [];
    public $salads = [];

    /**
     * {@inheritdoc}
     */
    public static function tableName() {
        return 'executive_menus';
    }

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['special_name', 'special_description', 'soup_options_json',
            'protein_options_json', 'carb_options_json', 'drink_options_json',
            'salad_options_json', 'additional_notes'], 'default', 'value' => null],
            [['price'], 'default', 'value' => 0.00],
            [['active'], 'default', 'value' => 1],
            [['day_of_week',], 'required'],
            [['day_of_week', 'special_description', 'additional_notes'], 'string'],
            [['soup_options_json', 'protein_options_json', 'carb_options_json',
            'drink_options_json', 'salad_options_json', 'created', 'modified'], 'safe'],
            [['price'], 'number'],
            [['active'], 'integer'],
            [['special_name'], 'string', 'max' => 255],
            [['created_by', 'modified_by'], 'string', 'max' => 50],
            ['day_of_week', 'in', 'range' => array_keys(self::optsDayOfWeek())],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'day_of_week' => 'Día de la semana en que aplica el menú',
            'special_name' => 'Nombre de la especialidad del día, ejemplo: (Ajiaco, frijoles, mondongo)',
            'special_description' => 'Descripción detallada de la especialidad del día para IA y clientes',
            'soup_options_json' => 'Opciones de sopa disponibles en formato JSON',
            'protein_options_json' => 'Opciones de proteína disponibles en formato JSON',
            'carb_options_json' => 'Opciones de carbohidrato disponibles en formato JSON',
            'drink_options_json' => 'Opciones de bebidas disponibles en formato JSON',
            'salad_options_json' => 'Opciones de ensalada disponibles en formato JSON',
            'additional_notes' => 'Notas adicionales visibles para clientes o IA',
            'price' => 'Precio base del menú ejecutivo',
            'active' => 'Indica si el menú está activo',
            'created' => 'Creado',
            'created_by' => 'Fecha de última actualización',
            'modified' => 'Modificado',
            'modified_by' => 'Fecha de última actualización',
        ];
    }

    /**
     * column day_of_week ENUM value labels
     * @return string[]
     */
    public static function optsDayOfWeek() {
        return [
            self::DAY_OF_WEEK_LUNES => 'lunes',
            self::DAY_OF_WEEK_MARTES => 'martes',
            self::DAY_OF_WEEK_MIERCOLES => 'miércoles',
            self::DAY_OF_WEEK_JUEVES => 'jueves',
            self::DAY_OF_WEEK_VIERNES => 'viernes',
            self::DAY_OF_WEEK_SABADO => 'sábado',
            self::DAY_OF_WEEK_DOMINGO => 'domingo',
        ];
    }

    /**
     * @return string
     */
    public function displayDayOfWeek() {
        return self::optsDayOfWeek()[$this->day_of_week];
    }

    /**
     * @return bool
     */
    public function isDayOfWeekLunes() {
        return $this->day_of_week === self::DAY_OF_WEEK_LUNES;
    }

    public function setDayOfWeekToLunes() {
        $this->day_of_week = self::DAY_OF_WEEK_LUNES;
    }

    /**
     * @return bool
     */
    public function isDayOfWeekMartes() {
        return $this->day_of_week === self::DAY_OF_WEEK_MARTES;
    }

    public function setDayOfWeekToMartes() {
        $this->day_of_week = self::DAY_OF_WEEK_MARTES;
    }

    /**
     * @return bool
     */
    public function isDayOfWeekMiercoles() {
        return $this->day_of_week === self::DAY_OF_WEEK_MIERCOLES;
    }

    public function setDayOfWeekToMiercoles() {
        $this->day_of_week = self::DAY_OF_WEEK_MIERCOLES;
    }

    /**
     * @return bool
     */
    public function isDayOfWeekJueves() {
        return $this->day_of_week === self::DAY_OF_WEEK_JUEVES;
    }

    public function setDayOfWeekToJueves() {
        $this->day_of_week = self::DAY_OF_WEEK_JUEVES;
    }

    /**
     * @return bool
     */
    public function isDayOfWeekViernes() {
        return $this->day_of_week === self::DAY_OF_WEEK_VIERNES;
    }

    public function setDayOfWeekToViernes() {
        $this->day_of_week = self::DAY_OF_WEEK_VIERNES;
    }

    /**
     * @return bool
     */
    public function isDayOfWeekSabado() {
        return $this->day_of_week === self::DAY_OF_WEEK_SABADO;
    }

    public function setDayOfWeekToSabado() {
        $this->day_of_week = self::DAY_OF_WEEK_SABADO;
    }

    /**
     * @return bool
     */
    public function isDayOfWeekDomingo() {
        return $this->day_of_week === self::DAY_OF_WEEK_DOMINGO;
    }

    public function setDayOfWeekToDomingo() {
        $this->day_of_week = self::DAY_OF_WEEK_DOMINGO;
    }

}
