class Course < ApplicationRecord
  has_many :lessons, class_name: "Lesson", foreign_key: "reference_id"

  def completion_percentage(user_id)
    total = lessons.count
    return 0 if total == 0

    completed = LessonCompletion.where(user_id: user_id, lesson_id: lessons.ids, completed: true).count
    ((completed.to_f / total) * 100).round(2)
  end
  
end
