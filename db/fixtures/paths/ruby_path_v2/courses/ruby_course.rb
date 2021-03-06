
course_sections = []
course_lessons = []

course = Course.seed(:indentifier_uuid) do |course|
  course.title = 'Ruby Revised'
  course.title_url = 'Ruby Revised'.parameterize
  course.description = 'The Ruby Course Revised'
  course.position = 1
  course.path_id = @path.first.id
  course.indentifier_uuid = '24d1e8dd-0b2f-468a-9152-2efc2abce72e'
end
@path_courses << course

# +++++++++++
# SECTION
# +++++++++++

section = Section.seed(:indentifier_uuid) do |section|
  section.indentifier_uuid = '5bd7b45a-d786-4149-b55a-f83516930b69'
  section.title = 'TDD'
  section.title_url = 'TDD'.parameterize
  section.position = 1
  section.course_id = course.first.id
  section.description = "Test Driven Development with Ruby"
end
course_sections << section

course_lessons << Lesson.seed(:indentifier_uuid, :section_id, [
  ruby_lessons.fetch('Test Driven Development').merge(section_id: section.first.id, position: 1),
  ruby_lessons.fetch('Introduction to RSpec').merge(section_id: section.first.id, position: 2),
  ruby_lessons.fetch('Testing Your Ruby Code').merge(section_id: section.first.id, position: 3),
])

# +++++++++++
# SECTION
# +++++++++++

section = Section.seed(:indentifier_uuid) do |section|
  section.indentifier_uuid = '190a66fe-628c-415a-91a4-b15b18d52a7b'
  section.title = 'Conclusion'
  section.title_url = 'Conclusion'.parameterize
  section.position = 2
  section.course_id = course.first.id
  section.description = "Conclusion to the Ruby Course"
end
course_sections << section

course_lessons << Lesson.seed(:indentifier_uuid, :section_id, [
  ruby_lessons.fetch('Ruby Final Project').merge(section_id: section.first.id, position: 1),
  ruby_lessons.fetch('Conclusion').merge(section_id: section.first.id, position: 2),
])

def destroy_orphans(persisted_collection, seeded_collection)
  orphans = persisted_collection.map(&:indentifier_uuid) - seeded_collection.map(&:indentifier_uuid)

  persisted_collection.where(indentifier_uuid: orphans).each(&:destroy)
end

destroy_orphans(course.first.lessons, course_lessons.flatten)
destroy_orphans(course.first.sections, course_sections.flatten)
