class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def users_all
    User.all
  end
end
