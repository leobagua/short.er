class ClickService
  def self.clicks_info_from(url_id)
    clicks = Click.where(url_id: url_id)
    clicks_by_date = clicks.select('COUNT(id) AS number_of_clicks', :date).group(:date)
    clicks_by_country = clicks.select('COUNT(id) AS number_of_clicks', :country).group(:country)
    {
        clicks_by_date: clicks_by_date,
        clicks_by_country: clicks_by_country
    }
  end

  def self.create_click(attributes)
    Click.transaction do
      Click.create attributes.merge(date: Date.today)
    end
  end
end