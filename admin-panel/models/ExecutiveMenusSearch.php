<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\ExecutiveMenus;

/**
 * ExecutiveMenusSearch represents the model behind the search form of `app\models\ExecutiveMenus`.
 */
class ExecutiveMenusSearch extends ExecutiveMenus
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'active'], 'integer'],
            [['day_of_week', 'special_name', 'special_description', 'soup_options_json', 'protein_options_json', 'carb_options_json', 'drink_options_json', 'salad_options_json', 'additional_notes', 'created', 'created_by', 'modified', 'modified_by'], 'safe'],
            [['price'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = ExecutiveMenus::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'price' => $this->price,
            'active' => $this->active,
            'created' => $this->created,
            'modified' => $this->modified,
        ]);

        $query->andFilterWhere(['like', 'day_of_week', $this->day_of_week])
            ->andFilterWhere(['like', 'special_name', $this->special_name])
            ->andFilterWhere(['like', 'special_description', $this->special_description])
            ->andFilterWhere(['like', 'soup_options_json', $this->soup_options_json])
            ->andFilterWhere(['like', 'protein_options_json', $this->protein_options_json])
            ->andFilterWhere(['like', 'carb_options_json', $this->carb_options_json])
            ->andFilterWhere(['like', 'drink_options_json', $this->drink_options_json])
            ->andFilterWhere(['like', 'salad_options_json', $this->salad_options_json])
            ->andFilterWhere(['like', 'additional_notes', $this->additional_notes])
            ->andFilterWhere(['like', 'created_by', $this->created_by])
            ->andFilterWhere(['like', 'modified_by', $this->modified_by]);

        return $dataProvider;
    }
}
