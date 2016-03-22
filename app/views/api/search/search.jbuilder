json.status 'success'
json.data do |json|
    json.array!(@test) do |test|
        json.Location test
        json.Restaurant test.Restaurant
    end

end