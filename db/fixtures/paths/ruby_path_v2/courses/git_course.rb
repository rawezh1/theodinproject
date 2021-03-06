course = Course.seed(:indentifier_uuid) do |course|
  course.title = 'Git'
  course.title_url = 'Git'.parameterize
  course.description = 'The Git Course'
  course.position = 2
  course.path_id = @path.first.id
  course.indentifier_uuid = '8ba6cc77-f545-4bc0-8689-e4d217f89df1'
end

# +++++++++++
# SECTION
# +++++++++++

section = Section.seed(:indentifier_uuid) do |section|
  section.indentifier_uuid = '06e718f4-5620-407d-83db-f709e64fc83c'
  section.title = 'Git in the real world'
  section.title_url = 'Git in the real world'.parameterize
  section.position = 1
  section.course_id = course.first.id
  section.description = "Bit of git in the real world"
end

Lesson.seed(:indentifier_uuid, :section_id, [
  git_lessons.fetch('A Deeper Look at Git').merge(section_id: section.first.id, position: 1),
  git_lessons.fetch('Using Git in the Real World').merge(section_id: section.first.id, position: 2),
])
