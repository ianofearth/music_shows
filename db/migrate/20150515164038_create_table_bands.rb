class CreateTableBands < ActiveRecord::Migration
  def change
  	create_table(:bands) do |t|
  		t.column(:name, :string)
  	end
  end
end
