json.status 'success'
json.data do |json|
    json.array!(@grep) do |grep|
        json.Distance distance_between(params[:lat], params[:long], grep.coordinate)
        json.Location grep
        json.Restaurant grep.Restaurant
    end

end