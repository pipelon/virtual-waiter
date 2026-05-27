<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ExecutiveMenusSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Menús';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-md-12">
                            <?= Html::a('Crear menú ejecutivo', ['create'], ['class' => 'btn btn-danger']) ?>
                        </div>
                    </div>


                    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

                    <?=
                    GridView::widget([
                        'dataProvider' => $dataProvider,
                        'filterModel' => $searchModel,
                        'columns' => [
                            'id',
                            [
                                'attribute' => 'day_of_week',
                                'format' => 'raw',
                                'header' => 'Día',
                                
                            ],
                            [
                                'attribute' => 'special_name',
                                'format' => 'raw',
                                'header' => 'Plato especial',
                                
                            ],
                            [
                                'attribute' => 'soup_options_json',
                                'format' => 'raw',
                                'header' => 'Sopas',
                                'value' => function ($model) {
                                    $soups = json_decode(
                                            $model->soup_options_json,
                                            true
                                    );
                                    if (empty($soups)) {
                                        return '-';
                                    }
                                    $html = '<ul class="mb-0 pl-3">';
                                    foreach ($soups as $soup) {
                                        $extraPrice = $soup["extra_price"] > 0 ? " ({$soup["extra_price"]})" : "";
                                        $html .= '<li>' . Html::encode($soup['name']) . $extraPrice . '</li>';
                                    }
                                    $html .= '</ul>';
                                    return $html;
                                }
                            ],
                            [
                                'attribute' => 'protein_options_json',
                                'format' => 'raw',
                                'header' => 'Proteínas',
                                'value' => function ($model) {
                                    $soups = json_decode(
                                            $model->protein_options_json,
                                            true
                                    );
                                    if (empty($soups)) {
                                        return '-';
                                    }
                                    $html = '<ul class="mb-0 pl-3">';
                                    foreach ($soups as $soup) {
                                        $extraPrice = $soup["extra_price"] > 0 ? " ({$soup["extra_price"]})" : "";
                                        $html .= '<li>' . Html::encode($soup['name']) . $extraPrice . '</li>';
                                    }
                                    $html .= '</ul>';
                                    return $html;
                                }
                            ],
                            [
                                'attribute' => 'carb_options_json',
                                'format' => 'raw',
                                'header' => 'Carbohidratos',
                                'value' => function ($model) {
                                    $soups = json_decode(
                                            $model->carb_options_json,
                                            true
                                    );
                                    if (empty($soups)) {
                                        return '-';
                                    }
                                    $html = '<ul class="mb-0 pl-3">';
                                    foreach ($soups as $soup) {
                                        $extraPrice = $soup["extra_price"] > 0 ? " ({$soup["extra_price"]})" : "";
                                        $html .= '<li>' . Html::encode($soup['name']) . $extraPrice . '</li>';
                                    }
                                    $html .= '</ul>';
                                    return $html;
                                }
                            ],
                            [
                                'attribute' => 'salad_options_json',
                                'format' => 'raw',
                                'header' => 'Ensalada',
                                'value' => function ($model) {
                                    $soups = json_decode(
                                            $model->salad_options_json,
                                            true
                                    );
                                    if (empty($soups)) {
                                        return '-';
                                    }
                                    $html = '<ul class="mb-0 pl-3">';
                                    foreach ($soups as $soup) {
                                        $extraPrice = $soup["extra_price"] > 0 ? " ({$soup["extra_price"]})" : "";
                                        $html .= '<li>' . Html::encode($soup['name']) . $extraPrice . '</li>';
                                    }
                                    $html .= '</ul>';
                                    return $html;
                                }
                            ],
                            [
                                'attribute' => 'drink_options_json',
                                'format' => 'raw',
                                'header' => 'Bebidas',
                                'value' => function ($model) {
                                    $soups = json_decode(
                                            $model->drink_options_json,
                                            true
                                    );
                                    if (empty($soups)) {
                                        return '-';
                                    }
                                    $html = '<ul class="mb-0 pl-3">';
                                    foreach ($soups as $soup) {
                                        $extraPrice = $soup["extra_price"] > 0 ? " ({$soup["extra_price"]})" : "";
                                        $html .= '<li>' . Html::encode($soup['name']) . $extraPrice . '</li>';
                                    }
                                    $html .= '</ul>';
                                    return $html;
                                }
                            ],
                            //'protein_options_json',
                            //'carb_options_json',
                            //'drink_options_json',
                            //'salad_options_json',
                            //'additional_notes:ntext',
                            //'price',
                            //'active',
                            //'created',
                            //'created_by',
                            //'modified',
                            //'modified_by',
                            ['class' => 'hail812\adminlte3\yii\grid\ActionColumn'],
                        ],
                        'summaryOptions' => ['class' => 'summary mb-2'],
                        'pager' => [
                            'class' => 'yii\bootstrap4\LinkPager',
                        ]
                    ]);
                    ?>


                </div>
                <!--.card-body-->
            </div>
            <!--.card-->
        </div>
        <!--.col-md-12-->
    </div>
    <!--.row-->
</div>
