<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\ExecutiveMenus */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Menús', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>

<div class="container-fluid">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-12">
                    <p>
                        <?= Html::a('Actualizar', ['update', 'id' => $model->id], ['class' => 'btn btn-danger']) ?>
                        <?= Html::a('Borrar', ['delete', 'id' => $model->id], [
                        'class' => 'btn btn-danger',
                        'data' => [
                        'confirm' => 'Estás seguro que deseas eliminar este ítem?',
                        'method' => 'post',
                        ],
                        ]) ?>
                    </p>
                    <?= DetailView::widget([
                    'model' => $model,
                    'attributes' => [
                                                'id',
                            'day_of_week',
                            'special_name',
                            'special_description:ntext',
                            'soup_options_json',
                            'protein_options_json',
                            'carb_options_json',
                            'drink_options_json',
                            'salad_options_json',
                            'additional_notes:ntext',
                            'price',
                            'active',
                            'created',
                            'created_by',
                            'modified',
                            'modified_by',
                    ],
                    ]) ?>
                </div>
                <!--.col-md-12-->
            </div>
            <!--.row-->
        </div>
        <!--.card-body-->
    </div>
    <!--.card-->
</div>