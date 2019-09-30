class DigestService

  def self.long_digest_url(long_url)
    Digest::SHA1.hexdigest long_url + salt
  end

  private

  def self.salt
    (Time.now.to_f * 1000).to_i.to_s
  end
end