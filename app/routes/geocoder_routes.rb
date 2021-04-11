class GeocoderRoutes < Application
  post '/' do
    geocoder_params = validate_with!(GeocoderParamsContract)

    coordinates = Geocoder.geocode(geocoder_params['city'])

    if coordinates.blank?
      status 204
      {}.to_json
    else
      status 200
      coordinates.to_json
    end
  end
end
