class Toot < ApplicationRecord
  belongs_to :user

  def self.toots_for(ids)
    where(user_id: ids).order(created_at: :desc)
  end
end
