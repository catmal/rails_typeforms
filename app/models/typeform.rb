class Typeform < ActiveRecord::Base
  before_create :randomize_id

  has_many :completed_typeforms

  validates :name, :typeform_uid, presence: true

  def has_been_completed?(user)
    CompletedTypeform.where(user_id: user.id).any?
  end

  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while self.class.where(id: self.id).exists?
  end
end