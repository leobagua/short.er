class Url < ApplicationRecord
  belongs_to :user
  has_many :clicks

  validates :long, :short, :description, :color, presence: true
  validate :valid_url?

  before_validation :define_short_url, if: :new_record?

  scope :from_current_user, -> (user) {where user: user}

  DIGEST_LENGTH = 6

  private

  def define_short_url
    current_digest_length = DIGEST_LENGTH
    long_digest = DigestService.long_digest_url long
    short = long_digest.slice(0..current_digest_length)

    self.short = loop do
      if short.size < DIGEST_LENGTH + 1
        long_digest = DigestService.long_digest_url long
        current_digest_length = DIGEST_LENGTH
      end
      break short unless Url.exists?(short: short)
      short = long_digest.slice(0..current_digest_length)
      current_digest_length += 1
    end
  end

  def valid_url?
    errors.add :long, 'não é uma url válida.' unless UrlService.valid_url? long
  end
end