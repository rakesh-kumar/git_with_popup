class Track < ActiveRecord::Base

  def polyline_points
    self.ponits.map(&:latlng)
  end
  def polyline
    Polylines::Encoder.encode_points(self.polyline_points)
  end
  

end
