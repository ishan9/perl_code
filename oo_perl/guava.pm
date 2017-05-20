package guava;
use strict;
use warnings;

BEGIN {
	push @INC, "C:\\Users\\Admin\\workspace\\perll2\\oo_perl";
}

use fruit;
our @ISA = qw(fruit);



sub new {
	my $class = shift;
	my $self = $class->SUPER::new($_[0], $_[1]);
	$self->{size} = $_[2];
	$self->{taste} = $_[3];
	bless $self, $class;
	return $self;
}
1;