@path_courses = []

@path = Path.seed(:indentifier_uuid) do |path|
  path.indentifier_uuid = '4ed1885c-82ea-4176-9f9b-ba0a9bd2b6ab'
  path.title = 'Test Ruby Path'
  path.description = "Example Ruby Path"
  path.position = 1
  path.default_path = true
end


load './db/fixtures/paths/ruby_path/courses/ruby_course.rb'
load './db/fixtures/paths/ruby_path/courses/git_course.rb'


