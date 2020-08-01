class ReplaceNameFieldsInUser < ActiveRecord::Migration[6.0]
  def change
  	remove_columns :posts,:category_id  
  end
end
