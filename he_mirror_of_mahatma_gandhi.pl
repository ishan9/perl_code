use strict;
use warnings;
my $tests;
my @num;

chomp ($tests = <STDIN>);

for (0..$tests-1)
{
chomp ($num[$_] = <STDIN>);
}
for (0..$tests-1)
{
my $rev = reverse $num[$_];
if ($num[$_] == $rev)
{
	if ($rev =~ m/[2345679]/)
	{
		print "NO\n";
	}
	else 
	{
		print "YES\n";
	}
}
else 
{
	print "NO\n";
}
}