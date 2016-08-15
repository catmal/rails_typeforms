class CompletedTypeform < ActiveRecord::Base
  belongs_to :user
  belongs_to :typeform
end