class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :url
      t.string :headline
      t.text :summary
      t.boolean :is_primary
      t.text :article_question
      t.string :article_geo

      t.timestamps null: false
    end
  end
end
