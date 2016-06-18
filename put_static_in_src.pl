#!/usr/bin/env perl

# Django template helper script.
# Replace anything with src="bah" with src="{% static 'bah' %}"
#
# Usage:
# perl put_static_in_src.pl <input_file_name.html> > <output_file_name>
#
# Notes: Does not work if src= has line breaks (since this is only looking one line at a time)
#
# Jay Liew <jayliew at jayliew dot com>
# June 2016

while(my $line = <>){
    if($line =~ /(.*)\ssrc=['|"]([a-zA-Z0-9.-_\?\/]+)['|"]\s(.*)/i){
      print $1;
      print " src=\"{% static '" . $2 . "' %}\" ";
      print $3;
      print "\n";
    }else{
      print $line;
    }
}
