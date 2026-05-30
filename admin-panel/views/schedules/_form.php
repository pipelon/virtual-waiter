<?php

use yii\helpers\Html;
use yii\bootstrap4\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Schedules */
/* @var $form yii\bootstrap4\ActiveForm */
?>

<div class="schedules-form">

    <?php $form = ActiveForm::begin(); ?>

    <?=
    $form->field($model, 'day_of_week')->dropDownList(
            ['lunes' => 'Lunes', 'martes' => 'Martes', 'miércoles' => 'Miércoles',
                'jueves' => 'Jueves', 'viernes' => 'Viernes', 'sábado' => 'Sábado',
                'domingo' => 'Domingo',], ['prompt' => ''])
    ?>

    <?= $form->field($model, 'is_open')->dropDownList(Yii::$app->utils->getFilterConditional()); ?>

    <?= $form->field($model, 'open_time')->input('time') ?>

    <?= $form->field($model, 'close_time')->input('time') ?>

    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-danger']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
