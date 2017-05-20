use strict;
use warnings;
use Data::Dumper;

#AUTOLOAD is used to handle undefined subroutine in perl

sub AUTOLOAD {
	our $AUTOLOAD;
	print $AUTOLOAD;
    print Dumper \@_;
}

welcome("foo","bar");
#welcome is a undefined function
#So Autoload will be called in this case.
