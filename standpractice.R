library(plotly)
library(geojson)

# Your GeoJSON data
geojson_data <- '{
    "type": "FeatureCollection",
    "features": [
        {
            "type": "Feature",
            "id" : 1,
            "geometry": {
                    "type": "Polygon",
                    "coordinates": [
                        [[0,90],[50,50],[30,40],[20,20],[40,30]]
                    ]
            }
        },
        {
            "type": "Feature",
            "id": 2,
            "geometry": {
                "type": "Polygon",
                "coordinates": [
                        [[6,5],[6,6],[5,6],[5,5],[6,5]]
                ]
            }
        }
    ]
}'

# Create Plotly map
plot_ly() %>%
  add_trace(
    type = 'scattermapbox',
    mode = 'lines+markers',
    fill = 'toself',
    lon = c(-111.042931, -112.491718, -112.491718, -111.042931, -109.594144, -109.594144, -111.042931), #6.28 for radius
    lat = c(47.7197318, 47.1255878, 44.228012, 43.6338688, 44.228012, 47.1255878, 47.7197318),  #360/6 for degree for points
    marker = list(size = 10),
    line = list(color = 'blue')
  ) %>%
  layout(
    mapbox = list(
      style = "open-street-map",
      zoom = 2,
      center = list(lon = 0, lat = 40)
    ),
    title = "GeoJSON Data with Plotly"
  )
