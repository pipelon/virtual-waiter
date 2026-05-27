<?php

use yii\helpers\Html;
use wbraganca\dynamicform\DynamicFormWidget;

/**
 * VARIABLES:
 *
 * $title
 * $items
 * $type
 * $form
 */
DynamicFormWidget::begin([
    'widgetContainer' => "dynamicform_wrapper_{$type}",
    'widgetBody' => ".container-{$type}",
    'widgetItem' => ".{$type}-item",
    'limit' => 10,
    'min' => 1,
    'insertButton' => ".add-{$type}",
    'deleteButton' => ".remove-{$type}",
    'model' => $items[0],
    'formId' => $form->id,
    'formFields' => [
        'name',
        'description',
        'extra_price',
    ],
]);
?>

<div class="card collapsed-card">
    <div class="card-header">
        <h3 class="card-title">
            <?= $title ?>
        </h3>
        <div class="card-tools">
            <button type="button"
                    class="btn btn-tool"
                    data-card-widget="collapse">
                <i class="fas fa-plus"></i>
            </button>
        </div>
    </div>

    <div class="card-body container-<?= $type ?>">
        <?php foreach ($items as $index => $item): ?>
            <div class="<?= $type ?>-item border rounded p-2 mb-2">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <?=
                        Html::textInput(
                                "{$type}Option[{$index}][name]",
                                $item->name,
                                [
                                    'class' =>
                                    'form-control form-control-sm',
                                    'placeholder' => 'Nombre'
                                ]
                        )
                        ?>
                    </div>
                    <div class="col-md-5">
                        <?=
                        Html::textInput(
                                "{$type}Option[{$index}][description]",
                                $item->description,
                                [
                                    'class' =>
                                    'form-control form-control-sm',
                                    'placeholder' => 'Descripción'
                                ]
                        )
                        ?>
                    </div>
                    <div class="col-md-2">
                        <?=
                        Html::textInput(
                                "{$type}Option[{$index}][extra_price]",
                                $item->extra_price,
                                [
                                    'class' =>
                                    'form-control form-control-sm',
                                    'placeholder' => '$ Extra'
                                ]
                        )
                        ?>
                    </div>
                    <div class="col-md-2 text-right">
                        <button type="button"
                                class="add-<?= $type ?> btn btn-success btn-xs">
                            <i class="fas fa-plus"></i>
                        </button>
                        <button type="button"
                                class="remove-<?= $type ?> btn btn-danger btn-xs">
                            <i class="fas fa-minus"></i>
                        </button>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>
<?php DynamicFormWidget::end(); ?>