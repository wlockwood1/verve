# Challenge for Software Engineer or Frontend Engineer

This app is based on the Coding Challenge for Verve Wireless, shown below.

## Project Description

Imagine that Verve has just received a new advertising campaign from a national coffee franchise to promote their new Chocolate Macchiato. They will be delivering a tab separated document with each store location so we can drive foot traffic into each location. Geo targeted ads are typically target to a 5 mile radius around the business. Your task is to create a web interface that accepts file uploads, stores it in a database and then displays a list ordered ordered by distance from the Verve Carlsbad office ( 33.1243208, -117.32582479999996 ).

#### Here’s what your web-based application must do:

1. Your app must accept ( via a form ) a tab delimited file with the following columns: business name, address, city, state, postal code, country, latitude, longitude. The example file is named offers_poi.tsv is included in this repo.
2. Your app must parse the given file and store the information in a database.
3. After upload, your application should display each location ordered by distance from the Verve Carlsbad office.
4. (Bonus Points) Provide an api to query for locations near a given latitude and longitude.

#### Documentation
* Only stores within a 5 mile radius of the Verve Wireless address or search address are listed. Users can change the radius they want to search if necessary. Distance between addresses is measured via Geocoder gem.
* While site says only .tsv files are accepted, app is built to accept both .csv and .tsv files
* Store locations are shown on map using the gmaps4rails gem.
* Files are imported via the Roo gem.
* The sample file provided in the challenge repo will not display any locations because all the locations in the file are in Minnesota. Sample files 'san_diego_addresses.tsv' and 'verve_example_addresses.tsv' to test are located in the public folder.

* Requirements for the headers in the tsv file are listed in the index page. The app will not be able to parse data if the header spellings are incorrect
*


#### Requirements to Run App
Clone this repo
Run bundle install - should be using Ruby 2.2.0
Migrate database - should be using Postgresql
Open project folder and run rails server
