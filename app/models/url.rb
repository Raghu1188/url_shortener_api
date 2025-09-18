class Url < ApplicationRecord

  validates :original_url, presence: true, format: URI::regexp(%w[http https])
  validates :short_code, uniqueness: true

end
