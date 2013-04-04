lfmcol2csv
==========

Convert [last.fm](http://www.last.fm/) XML export files created by a [custom script](https://github.com/l0b0/export/blob/master/last.fm.pl) to comma-separated values for import with services like [Ivy](http://ivyishere.org/).

Why not just use the native last.fm export? It just gets stuck at 0% or reports "Sorry, something went wrong whilst generating your file. Please try again." repeatedly. Until that's fixed you can use this.

It's really fast; less than 200 milliseconds to process over 5000 tracks.

Use
---

    xsltproc lfmcol2csv.xsl /path/to/your/playlist.xml > playlist.csv

Tests
-----

See `test.sh` and `example.*`. You'll need [shunit2](http://code.google.com/p/shunit2/) to run them.
