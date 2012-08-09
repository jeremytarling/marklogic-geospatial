marklogic-geospatial
====================

a project to learn about MarkLogic's geospatial capabilities, it uses the OpenLayers JS library (http://openlayers.org/) to display a maps interface and source data from a BBC Locator API query for places in London

requires MarkLogic 5 Express: http://developer.marklogic.com/express

1. open the MarkLogic admin interface http://localhost:8001/ 
2. create a new App Server and point it at this project folder
3. create a corresponding Database and Forest, check it's attached
4. run the import_geonames.xqy query in the MarkLogic query console http://localhost:8000/qconsole/ to import the data into the database (edit the $path to the london.xml file)
5. then view http://localhost:{port}/map.html  (where {port} is what you set up in step 2)


