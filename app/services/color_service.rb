class ColorService

  COLORS = %W(#f5365c #fb6340 #ffd600 #11cdef #5e72e4).freeze

  def self.random_sample
    COLORS.sample
  end
end