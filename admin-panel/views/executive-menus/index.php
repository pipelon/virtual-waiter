<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ExecutiveMenusSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Executive Menuses';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-md-12">
                            <?= Html::a('Crear Executive Menus', ['create'], ['class' => 'btn btn-danger']) ?>
                        </div>
                    </div>


                                                                                    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
                    
                                                            <?= GridView::widget([
                        'dataProvider' => $dataProvider,
                        'filterModel' => $searchModel,
                        'columns' => [
                        
                                                    'id',
                            'day_of_week',
                            'special_name',
                            'special_description:ntext',
                            'soup_options_json',
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
                        ]); ?>
                    
                    
                </div>
                <!--.card-body-->
            </div>
            <!--.card-->
        </div>
        <!--.col-md-12-->
    </div>
    <!--.row-->
</div>
