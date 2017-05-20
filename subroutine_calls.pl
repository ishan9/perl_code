use strict;
use warnings;

#when &prefixed 
#a subroutine call has the contents of the current @_ array passed to it
#this is most often use to call subroutines from within other subroutines

#without &prefixed
# the current @_ will have no arguments unless passed explicitly


sub A {
	B();
}

sub C {
	&B;
}

sub B {
	my $test = shift;
	my @f = caller; 
	print "@f";
	print $test."\n";
}

#It is printing the parameter correctly.
C("Ishan");

#in case of A it is throwing a uninitialized error
A("Sood");
