class Url < ApplicationRecord
  belongs_to :user
  has_many :clicks

  validates :long, :short, :description, :color, presence: true
  validate :valid_url?

  before_validation :define_short_url, if: :new_record?

  scope :from_current_user, -> (user) { where user: user }

  DIGEST_LENGTH = 6

  private

  def define_short_url
    short_url = digest_short(long)
    self.short = loop do
      break short_url unless Url.exists?(short: short_url)
      short_url = digest_short(long)
    end
  end

  def digest_short(url)
    DigestService.long_digest_url(url)[0...DIGEST_LENGTH]
  end

  def valid_url?
    errors.add :long, 'is not a valid url' unless UrlService.valid_url? long
  end
end