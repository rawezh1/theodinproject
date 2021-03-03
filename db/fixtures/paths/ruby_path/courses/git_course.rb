course = Course.seed(:indentifier_uuid) do |course|
  course.title = 'Git'
  course.title_url = 'Git'.parameterize
  course.description = 'The Git Course'
  course.position = 2
  course.path_id = @path.first.id
  course.indentifier_uuid = 'c87cde4e-2730-42d6-ad39-4ee249d3adde'
end

# +++++++++++
# SECTION
# +++++++++++

section = Section.seed(:indentifier_uuid) do |section|
  section.indentifier_uuid = '74e6bb05-2537-4c0a-b1ca-3dc721284ada'
  section.title = 'Git in the real world'
  section.title_url = 'Git in the real world'.parameterize
  section.position = 1
  section.course_id = course.first.id
  section.description = "Bit of git in the real world"
end

Lesson.seed(
  :indentifier_uuid,
  git_lessons.fetch('A Deeper Look at Git').merge(section_id: section.first.id, position: 1),
  git_lessons.fetch('Using Git in the Real World').merge(section_id: section.first.id, position: 2),
)
