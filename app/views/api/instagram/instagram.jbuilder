json.status 'success'
json.data do |json|
    json.array!(@instagram) do |instagram|
        json.Instagram instagram
    end
end
    