xquery version "1.0-ml";
import module namespace gml = "http://www.opengis.net/gml"
   at "/MarkLogic/geospatial/gml.xqy";



declare function local:parse-csv()
{
	let $polygon-csv := xdmp:get-request-field("points")
	let $lines := tokenize($polygon-csv, ':')
	return

			for $line in $lines
			let $fields := tokenize($line, ',')
			return 
				<gml:Point><gml:pos>{$fields}</gml:pos></gml:Point>

};

declare function local:polygon()
{
	let $polygon := local:parse-csv()
	return 
		cts:search(//location, 
			gml:geospatial-query(
				gml:polygon( $polygon )
			)
		)
};

<locations>
{ local:polygon() }
</locations>

(: 
http://localhost:7003/search.xqy?polygon=59.138672053814,-0.035156384110451:49.646484553814,-10.93359388411:44.373047053814,10.86328111589
:)
 