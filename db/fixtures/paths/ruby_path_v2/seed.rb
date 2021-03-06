@path_courses = []

@path = Path.seed(:indentifier_uuid) do |path|
  path.indentifier_uuid = 'd1c51e59-784d-47fb-a2f8-97ed3b9b34d3'
  path.title = 'Test Ruby Path 2'
  path.description = "Example Ruby Path 2"
  path.position = 1
  path.default_path = true
end


load './db/fixtures/paths/ruby_path_v2/courses/ruby_course.rb'
load './db/fixtures/paths/ruby_path_v2/courses/git_course.rb'


