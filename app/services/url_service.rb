class UrlService

  PROTOCOL_REGEX = /^(http|https|ftp):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

  def self.create_url(attributes)
    Url.transaction do
      Url.create attributes.merge(color: ColorService.random_sample)
    end
  end

  def self.update_url(url, attributes)
    Url.transaction do
      url.update attributes
    end
  end

  def self.valid_url?(url)
    url.prepend('http://') unless url =~ PROTOCOL_REGEX
    (url =~ PROTOCOL_REGEX).present?
  end
end