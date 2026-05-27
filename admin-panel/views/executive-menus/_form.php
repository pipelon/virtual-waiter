<?php

use yii\helpers\Html;
use yii\bootstrap4\ActiveForm;
use wbraganca\dynamicform\DynamicFormWidget;

/* @var $this yii\web\View */
/* @var $model app\models\ExecutiveMenus */
/* @var $form yii\bootstrap4\ActiveForm */
?>

<div class="executive-menus-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'day_of_week')->dropDownList(['lunes' => 'Lunes', 'martes' => 'Martes', 'miércoles' => 'Miércoles', 'jueves' => 'Jueves', 'viernes' => 'Viernes', 'sábado' => 'Sábado', 'domingo' => 'Domingo',], ['prompt' => '']) ?>

    <?= $form->field($model, 'special_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'special_description')->textarea(['rows' => 6]) ?>

    <!-- AGREGAR SOPAS DEL DIA -->
    <?=
    $this->render('_dynamic_options', [
        'title' => 'Sopas',
        'items' => $model->soups,
        'type' => 'Soup',
        'form' => $form,
    ])
    ?>

    <!-- AGREGAR PROTEINAS DEL DÍA -->
    <?=
    $this->render('_dynamic_options', [
        'title' => 'Proteínas',
        'items' => $model->proteins,
        'type' => 'Protein',
        'form' => $form,
    ])
    ?>

    <!-- AGREGAR CARBOHIDRATOS DEL DÍA -->
    <?=
    $this->render('_dynamic_options', [
        'title' => 'Carbohidrato',
        'items' => $model->carbs,
        'type' => 'Carb',
        'form' => $form,
    ])
    ?>

    <!-- AGREGAR ENSALADA DEL DÍA -->
    <?=
    $this->render('_dynamic_options', [
        'title' => 'Ensaladas',
        'items' => $model->salads,
        'type' => 'Salad',
        'form' => $form,
    ])
    ?>   

    <!-- AGREGAR BEBIDAS DEL DÍA -->
    <?=
    $this->render('_dynamic_options', [
        'title' => 'Bebidas',
        'items' => $model->drinks,
        'type' => 'Drink',
        'form' => $form,
    ])
    ?>

    <?= $form->field($model, 'additional_notes')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'price')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'active')->dropDownList(Yii::$app->utils->getFilterConditional()); ?>

    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-danger']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
