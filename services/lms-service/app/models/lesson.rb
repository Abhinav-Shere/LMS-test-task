class Lesson < ApplicationRecord
  belongs_to :course
  before_create :set_aggregate_id
  private

  def set_aggregate_id
    self.aggregate_id ||= SecureRandom.uuid
  end
end
