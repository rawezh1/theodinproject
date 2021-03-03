
course_sections = []
course_lessons = []

course = Course.seed(:indentifier_uuid) do |course|
  course.title = 'Ruby Revised'
  course.title_url = 'Ruby Revised'.parameterize
  course.description = 'The Ruby Course Revised'
  course.position = 1
  course.path_id = @path.first.id
  course.indentifier_uuid = '43854e72-54c3-4fca-9be3-73d2281682de'
end
@path_courses << course

# +++++++++++
# SECTION
# +++++++++++

section = Section.seed(:indentifier_uuid) do |section|
  section.indentifier_uuid = '79e3cd97-9e46-40f4-8927-57cc85999913'
  section.title = 'TDD'
  section.title_url = 'TDD'.parameterize
  section.position = 1
  section.course_id = course.first.id
  section.description = "Test Driven Development with Ruby"
end
course_sections << section

course_lessons << Lesson.seed(
  :indentifier_uuid,
  ruby_lessons.fetch('Test Driven Development').merge(section_id: section.first.id, position: 1),
  ruby_lessons.fetch('Introduction to RSpec').merge(section_id: section.first.id, position: 2),
  ruby_lessons.fetch('Testing Your Ruby Code').merge(section_id: section.first.id, position: 3),
)

# +++++++++++
# SECTION
# +++++++++++

section = Section.seed(:indentifier_uuid) do |section|
  section.indentifier_uuid = '67c481ab-0849-47a6-849e-f2e6f32957fa'
  section.title = 'Conclusion'
  section.title_url = 'Conclusion'.parameterize
  section.position = 2
  section.course_id = course.first.id
  section.description = "Conclusion to the Ruby Course"
end
course_sections << section

course_lessons << Lesson.seed(
  :indentifier_uuid,
  ruby_lessons.fetch('Ruby Final Project').merge(section_id: section.first.id, position: 1),
  ruby_lessons.fetch('Conclusion').merge(section_id: section.first.id, position: 2),
)

def destroy_orphans(persisted_collection, seeded_collection)
  orphans = persisted_collection.map(&:indentifier_uuid) - seeded_collection.map(&:indentifier_uuid)

  persisted_collection.where(indentifier_uuid: orphans).each(&:destroy)
end

destroy_orphans(course.first.lessons, course_lessons.flatten)
destroy_orphans(course.first.sections, course_sections.flatten)

# orphans = course.first.lessons.map(&:indentifier_uuid) - course_lessons.flatten.map { |lesson| lesson.indentifier_uuid  }
# course.first.lessons.where(indentifier_uuid: orphans).each(&:destroy)
