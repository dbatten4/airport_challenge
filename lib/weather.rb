module Weather

  def weather
    [:stormy, :sunny, :sunny, :sunny, :sunny].sample 
  end

  def stormy?
    weather == :stormy ? true : false
  end

end