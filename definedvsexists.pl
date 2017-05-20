use strict;
use warnings;

my %sounds = (dog => 'woof', cat => 'meow', goldfish => undef);


if (exists $sounds{goldfish}) {print "key goldfish exists";}

unless (defined $sounds{goldfish}) {print "\nkey goldfish does not contain value";}