class Location < ActiveRecord::Base
    self.table_name = "Location"

    has_one :Restaurant

    # ST_DWithin is Slower than ST_Distance
    scope :nearby_to,
    lambda { |latitude, longitude, distance, limit|
      joins(:Restaurant)
      .order("count DESC")
      .where("ST_DWithin(coordinate, 
        ST_GeographyFromText('SRID=4326;POINT(#{longitude} #{latitude})'), ?)", distance)
      .limit("#{limit}")
    }

        # joins({:Restaurant => :InstagramRestaurant})
    scope :grep, lambda { |latitude, longitude, distance, limit|
      joins(:Restaurant)
        .order("count DESC")
        .where("ST_Distance(coordinate,
            ST_GeographyFromText('SRID=4326;POINT(#{longitude} #{latitude})') )
            <= #{distance}")
        .limit("#{limit}")
    }

    def self.distance_between(lat, long, point)
      select = "ST_Distance(gg1, gg2)"
      from = "(SELECT  ST_GeographyFromText('SRID=4326;POINT(#{long} #{lat})') AS gg1, ST_GeographyFromText('SRID=4326;#{point}') AS gg2) AS foo"

      # 1609.344 is how many meters are in a mile
      distance = Location.select(select).from(from)
      distance[0].st_distance.to_i
      # "%.2f" % (distance[0].st_distance.to_f/1609.344)
    end

    # %%%%%Moon-o version%%%%
    


end
