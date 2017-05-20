use strict;
use warnings;

my %sounds = qw(cat meow goldfish undef dog woof);

while (my ($nextkey, $nextval)= each %sounds) {
	print "$nextkey has a value $nextval";
	print "\n";
}