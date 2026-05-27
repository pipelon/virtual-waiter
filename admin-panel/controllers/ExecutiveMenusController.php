<?php

namespace app\controllers;

use Yii;
use app\models\ExecutiveMenus;
use app\models\ExecutiveMenusSearch;
use app\models\MenuOption;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;

/**
 * ExecutiveMenusController implements the CRUD actions for ExecutiveMenus model.
 */
class ExecutiveMenusController extends Controller {

    /**
     * {@inheritdoc}
     */
    public function behaviors() {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all ExecutiveMenus models.
     * @return mixed
     */
    public function actionIndex() {
        $searchModel = new ExecutiveMenusSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single ExecutiveMenus model.
     * @param int $id ID
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id) {
        return $this->render('view', [
                    'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new ExecutiveMenus model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new ExecutiveMenus();

        $model->soups = [new MenuOption()];
        $model->proteins = [new MenuOption()];
        $model->drinks = [new MenuOption()];
        $model->carbs = [new MenuOption()];
        $model->salads = [new MenuOption()];

        if ($model->load(Yii::$app->request->post())) {

            $model->soup_options_json = $this->buildJsonOptions('SoupOption');

            $model->protein_options_json = $this->buildJsonOptions('ProteinOption');

            $model->drink_options_json = $this->buildJsonOptions('DrinkOption');

            $model->carb_options_json = $this->buildJsonOptions('CarbOption');

            $model->salad_options_json = $this->buildJsonOptions('SaladOption');

            if ($model->save()) {
                return $this->redirect(['index']);
            }
        }

        return $this->render('create', [
                    'model' => $model,
        ]);
    }

    /**
     * Updates an existing ExecutiveMenus model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id ID
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id) {
        $model = $this->findModel($id);

        /**
         * ============================================
         * CARGAR JSONS EXISTENTES
         * ============================================
         */
        $model->soups = $this->loadJsonOptions(
                $model->soup_options_json
        );

        $model->proteins = $this->loadJsonOptions(
                $model->protein_options_json
        );

        $model->drinks = $this->loadJsonOptions(
                $model->drink_options_json
        );

        $model->carbs = $this->loadJsonOptions(
                $model->carb_options_json
        );

        $model->salads = $this->loadJsonOptions(
                $model->salad_options_json
        );


        if ($model->load(Yii::$app->request->post())) {

            /**
             * JSON SOPAS
             */
            $model->soup_options_json = $this->buildJsonOptions(
                    'SoupOption'
            );

            /**
             * JSON PROTEÍNAS
             */
            $model->protein_options_json = $this->buildJsonOptions(
                    'ProteinOption'
            );

            /**
             * JSON BEBIDAS
             */
            $model->drink_options_json = $this->buildJsonOptions(
                    'DrinkOption'
            );

            /**
             * JSON CARBS
             */
            $model->carb_options_json = $this->buildJsonOptions(
                    'CarbOption'
            );

            /**
             * JSON ENSALADAS
             */
            $model->salad_options_json = $this->buildJsonOptions(
                    'SaladOption'
            );


            if ($model->save()) {
                return $this->redirect(['index']);
            }
        }

        return $this->render('update', [
                    'model' => $model,
        ]);
    }

    private function buildJsonOptions($postKey) {
        $items = Yii::$app->request->post($postKey, []);

        $result = [];

        if (!empty($items)) {

            foreach ($items as $item) {

                if (empty($item['name'])) {
                    continue;
                }

                $result[] = [
                    'name' => $item['name'],
                    'description' =>
                    $item['description'] ?? '',
                    'extra_price' =>
                    $item['extra_price'] ?? 0,
                ];
            }
        }

        return json_encode($result);
    }

    private function loadJsonOptions($json) {
        $decoded = json_decode($json, true);

        $models = [];

        if (!empty($decoded)) {

            foreach ($decoded as $item) {

                $model = new MenuOption();

                $model->name = $item['name'] ?? '';

                $model->description = $item['description'] ?? '';

                $model->extra_price = $item['extra_price'] ?? 0;

                $models[] = $model;
            }
        } else {

            $models[] = new MenuOption();
        }

        return $models;
    }

    /**
     * Deletes an existing ExecutiveMenus model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id ID
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id) {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the ExecutiveMenus model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id ID
     * @return ExecutiveMenus the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = ExecutiveMenus::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

}
