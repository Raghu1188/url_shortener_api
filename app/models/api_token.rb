class ApiToken < ApplicationRecord
  
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.hex(20)
  end

end
