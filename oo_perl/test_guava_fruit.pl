use strict;
use warnings;

BEGIN {
	push @INC, "C:\\Users\\Admin\\workspace\\perll2\\oo_perl";
}

use guava;
use Data::Dump qw(dump);
my $obj = guava->new("mango", "yellow", "med", "sweet");

#my $obj = fruit->new("mango", "yellow");
print dump($obj);
my $obj2 = fruit->new("mango", "yellow", "med", "sweet");

print dump($obj2);