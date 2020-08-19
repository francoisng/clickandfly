class AddPhotoToAirplanes < ActiveRecord::Migration[6.0]
  def change
    add_column :airplanes, :photo, :string
  end
end
