class RemovePathCourses < ActiveRecord::Migration[6.1]
  def change
    drop_table :path_courses
    add_column :courses, :path_id, :integer, null: true
  end
end
