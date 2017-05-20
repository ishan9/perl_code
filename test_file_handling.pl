use strict;
use warnings;
use Data::Dump qw(dump);

my $dir = 'C:/Users/Admin/Desktop/test';
my @all = <$dir/*.html>;
my $num = @all;
print "Number of file present: $num\n";

foreach (@all)
{
	open (FH ,"<", $_);
	while (my $input = <FH>)
	{
		print $input;
	}
}
print dump(@all);