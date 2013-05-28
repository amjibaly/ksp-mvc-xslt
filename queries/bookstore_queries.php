<?php

class ksp_bookstore_queries
{
  var $query_output;
  
  function ksp_bookstore_queries($query_string) {
    $query_name = $query_string . '_query';
    $this->query_output = $this->$query_name();
  }
  
  function output() {
    return $this->query_output;
  }

	function books_query() {
		$db = mysql_pconnect('localhost', 'kspuser', 'kspass');
		mysql_select_db('kspnet');

		//get series images
		$query = 'select series, image from book_series_def';
		$result = mysql_query($query);
		$series_images = '';
		while ( $row = mysql_fetch_array($result) ) {
			list($key, $value) = $row;
			$series_images[htmlspecialchars($key)] = $value;
		}

		$query = 'select books.bookid, title, series, seq ';
		$query.= 'from books left join book_series on books.bookid = book_series.bookid ';
		$query.= 'order by book_series.series';
		$result = mysql_query($query);

		$series_name = '';
		$series_xml = new ksp_xml('series','','');
		$xml = new ksp_xml('books', '', '');

		while ( $row = mysql_fetch_array($result) ) {
			$id = $row['bookid'];
			$title = htmlspecialchars($row['title']);
			// not in a series
			if ( $row['series'] == NULL ) {
				$title_xml = new ksp_xml( 'title', array('id' => $id), $title );
				$xml->add( 'single', '', $title_xml->build() );
			}
			// still in same series
			else if ( $row['series'] == $series_name ) {
				$title_attributes = array( 'id' => $id, 'seq' => $row['seq'] );
				$series_xml->add( 'title', $title_attributes, $title );      
			}
			// new series
			else {
				if ($series_name != '') {
					$xml->append($series_xml->build());
				}

				$series_name = htmlspecialchars( $row['series'] );
				$series_xml = new ksp_xml( 'series', '', '' );
				$series_xml->add( 'name', '', $series_name );
				$series_xml->add( 'image', '', $series_images[$series_name] );

				$title_attributes = array( 'id' => $id, 'seq' => $row['seq'] );
				$series_xml->add( 'title', $title_attributes, $title );
			}
		}

		$output = $xml->append( $series_xml->build() );
		return $output;
	}

	function tapes_query() {
		$db = mysql_pconnect('localhost', 'kspuser', 'kspass');
		mysql_select_db('kspnet');

    $query = 'select tapes.tapeid, titleA as title, image from tape_albums, tapes ';
    $query.= ' where tape_albums.tapeid = tapes.tapeid';
    $result = mysql_query($query);
    
    $xml = new ksp_xml( 'tapes', '', '' );
    
    while ( $row = mysql_fetch_array($result) ) {
      $album_xml = new ksp_xml( 'album', '', '' );
      $album_xml->add( 'title', array('id' => $row['tapeid']), htmlspecialchars($row['title']) );
      $album_xml->add( 'image', '', $row['image'] );
      
      $xml->append( $album_xml->build() );
    }
    
		$query = 'select distinct topic from tape_topics';
		$result = mysql_query($query);

		while ( $row = mysql_fetch_array($result) ) {
			$xml->add( 'topic', '', htmlspecialchars($row['topic']) );
		}

		$output = $xml->build();
		return $output;
	}

}

?>