xquery version "1.0-ml"; 
import module namespace info = "http://marklogic.com/appservices/infostudio" at "/MarkLogic/appservices/infostudio/info.xqy";

declare namespace geo = "http://marklogic.com/geospatial";
declare namespace gml = "http://www.opengis.net/gml";


let $path := "/Users/tarlij01/Desktop/MarkLogic-training/geospatial/london.xml"
let $doc := xdmp:document-get($path)


for $location in $doc//location
let $location-id := tokenize($location/id, ":")[last()]
let $lat-lon := concat($location/latitude/text(), " ", $location/longitude/text())
return
  ( xdmp:log(concat("Adding location:", $location-id)),
    xdmp:document-insert(
     concat("/locations/", $location-id, ".xml"),
     <location xmlns:geo="http://marklogic.com/geospatial">
    <id>{$location/id/text()}</id>
    <name>{$location/name/text()}</name>
    <latitude>{$location/latitude/text()}</latitude>
    <longitude>{$location/longitude/text()}</longitude>
    <gml:Point><gml:pos>{$lat-lon}</gml:pos></gml:Point>
    </location>,
     xdmp:default-permissions(), 
     xdmp:default-collections(), 
     10)
  )
