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

    <?= $form->field($model, 'day_of_week')->dropDownList([ 'lunes' => 'Lunes', 'martes' => 'Martes', 'miércoles' => 'Miércoles', 'jueves' => 'Jueves', 'viernes' => 'Viernes', 'sábado' => 'Sábado', 'domingo' => 'Domingo', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'special_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'special_description')->textarea(['rows' => 6]) ?>
	
	<h3>Sopas</h3>
	
	<?php 
	DynamicFormWidget::begin([
		'widgetContainer' => 'dynamicform_wrapper',
		'widgetBody' => '.container-items',
		'widgetItem' => '.item',
		'limit' => 10,
		'min' => 1,
		'insertButton' => '.add-item',
		'deleteButton' => '.remove-item',
		'model' => $model->soups[0],
		'formId' => $form->id,
		'formFields' => [
			'name',
			'description',
			'extra_price',
		],
	]); 
	?>
	
	<div class="container-items">

    <?php foreach ($model->soups as $index => $soup): ?>

        <div class="item panel panel-default">

            <div class="panel-heading">

                <h4>
                    Sopa

                    <button type="button"
                        class="add-item btn btn-success btn-xs pull-right">
                        +
                    </button>

                    <button type="button"
                        class="remove-item btn btn-danger btn-xs pull-right"
                        style="margin-right:5px;">
                        -
                    </button>

                </h4>

            </div>

            <div class="panel-body">

                <?= Html::activeTextInput(
                    $soup,
                    "[{$index}]name",
                    [
                        'class' => 'form-control',
                        'placeholder' => 'Nombre'
                    ]
                ) ?>

                <br>

                <?= Html::activeTextarea(
                    $soup,
                    "[{$index}]description",
                    [
                        'class' => 'form-control',
                        'placeholder' => 'Descripción'
                    ]
                ) ?>

                <br>

                <?= Html::activeTextInput(
                    $soup,
                    "[{$index}]extra_price",
                    [
                        'class' => 'form-control',
                        'placeholder' => 'Precio extra'
                    ]
                ) ?>

            </div>

        </div>

    <?php endforeach; ?>

</div>

<?php DynamicFormWidget::end(); ?>

    <?= $form->field($model, 'protein_options_json')->textInput() ?>

    <?= $form->field($model, 'carb_options_json')->textInput() ?>

    <?= $form->field($model, 'drink_options_json')->textInput() ?>

    <?= $form->field($model, 'salad_options_json')->textInput() ?>

    <?= $form->field($model, 'additional_notes')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'price')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'active')->textInput() ?>

    <?= $form->field($model, 'created')->textInput() ?>

    <?= $form->field($model, 'created_by')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'modified')->textInput() ?>

    <?= $form->field($model, 'modified_by')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
    <?= Html::submitButton('Guardar', ['class' => 'btn btn-danger']) ?>
    </div>

<?php ActiveForm::end(); ?>

</div>
