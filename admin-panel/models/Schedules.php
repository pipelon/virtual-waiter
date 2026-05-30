<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "schedules".
 *
 * @property int $id ID
 * @property string $day_of_week Día de la semana
 * @property int $is_open Indica si abre ese día
 * @property string|null $open_time Hora de apertura
 * @property string|null $close_time Hora de cierre
 * @property string $created Creado
 * @property string $created_by Creado por
 * @property string $modified Modificado
 * @property string $modified_by Modificado por
 */
class Schedules extends \yii\db\ActiveRecord
{

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

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'schedules';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['open_time', 'close_time'], 'default', 'value' => null],
            [['is_open'], 'default', 'value' => 1],
            [['day_of_week', 'created', 'created_by', 'modified', 'modified_by'], 'required'],
            [['day_of_week'], 'string'],
            [['is_open'], 'integer'],
            [['open_time', 'close_time', 'created', 'modified'], 'safe'],
            [['created_by', 'modified_by'], 'string', 'max' => 50],
            ['day_of_week', 'in', 'range' => array_keys(self::optsDayOfWeek())],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'day_of_week' => 'Día de la semana',
            'is_open' => 'Indica si abre ese día',
            'open_time' => 'Hora de apertura',
            'close_time' => 'Hora de cierre',
            'created' => 'Creado',
            'created_by' => 'Creado por',
            'modified' => 'Modificado',
            'modified_by' => 'Modificado por',
        ];
    }


    /**
     * column day_of_week ENUM value labels
     * @return string[]
     */
    public static function optsDayOfWeek()
    {
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
    public function displayDayOfWeek()
    {
        return self::optsDayOfWeek()[$this->day_of_week];
    }

    /**
     * @return bool
     */
    public function isDayOfWeekLunes()
    {
        return $this->day_of_week === self::DAY_OF_WEEK_LUNES;
    }

    public function setDayOfWeekToLunes()
    {
        $this->day_of_week = self::DAY_OF_WEEK_LUNES;
    }

    /**
     * @return bool
     */
    public function isDayOfWeekMartes()
    {
        return $this->day_of_week === self::DAY_OF_WEEK_MARTES;
    }

    public function setDayOfWeekToMartes()
    {
        $this->day_of_week = self::DAY_OF_WEEK_MARTES;
    }

    /**
     * @return bool
     */
    public function isDayOfWeekMiercoles()
    {
        return $this->day_of_week === self::DAY_OF_WEEK_MIERCOLES;
    }

    public function setDayOfWeekToMiercoles()
    {
        $this->day_of_week = self::DAY_OF_WEEK_MIERCOLES;
    }

    /**
     * @return bool
     */
    public function isDayOfWeekJueves()
    {
        return $this->day_of_week === self::DAY_OF_WEEK_JUEVES;
    }

    public function setDayOfWeekToJueves()
    {
        $this->day_of_week = self::DAY_OF_WEEK_JUEVES;
    }

    /**
     * @return bool
     */
    public function isDayOfWeekViernes()
    {
        return $this->day_of_week === self::DAY_OF_WEEK_VIERNES;
    }

    public function setDayOfWeekToViernes()
    {
        $this->day_of_week = self::DAY_OF_WEEK_VIERNES;
    }

    /**
     * @return bool
     */
    public function isDayOfWeekSabado()
    {
        return $this->day_of_week === self::DAY_OF_WEEK_SABADO;
    }

    public function setDayOfWeekToSabado()
    {
        $this->day_of_week = self::DAY_OF_WEEK_SABADO;
    }

    /**
     * @return bool
     */
    public function isDayOfWeekDomingo()
    {
        return $this->day_of_week === self::DAY_OF_WEEK_DOMINGO;
    }

    public function setDayOfWeekToDomingo()
    {
        $this->day_of_week = self::DAY_OF_WEEK_DOMINGO;
    }
}
