class Url < ApplicationRecord

  validates :original_url, presence: true, format: URI::regexp(%w[http https])
  validates :short_code, uniqueness: true

  before_create :generate_short_code

  def generate_short_code
    loop do
      self.short_code = SecureRandom.alphanumeric(6)
      break unless Url.exists?(short_code: short_code)
    end
  end

end
