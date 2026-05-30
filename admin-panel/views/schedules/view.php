<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Schedules */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Horarios', 'url' => ['index']];
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
                        <?=
                        Html::a('Borrar', ['delete', 'id' => $model->id], [
                            'class' => 'btn btn-danger',
                            'data' => [
                                'confirm' => 'Estás seguro que deseas eliminar este ítem?',
                                'method' => 'post',
                            ],
                        ])
                        ?>
                    </p>
                    <?=
                    DetailView::widget([
                        'model' => $model,
                        'attributes' => [
                            'id',
                            'day_of_week',
                            [
                                'attribute' => 'is_open',
                                'format' => 'raw',
                                'value' => function ($data) {
                                    return Yii::$app->utils->getConditional($data->is_open);
                                },
                            ],
                            'open_time:time',
                            'close_time:time',
                            'created:datetime',
                            'created_by',
                            'modified:datetime',
                            'modified_by',
                        ],
                    ])
                    ?>
                </div>
                <!--.col-md-12-->
            </div>
            <!--.row-->
        </div>
        <!--.card-body-->
    </div>
    <!--.card-->
</div>