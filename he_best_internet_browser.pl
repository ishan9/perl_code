use strict;
use warnings;

my $tc = <STDIN>;
chomp $tc;

my @user_input_arr;
my $i = 0;
while($i<$tc)
{
	$user_input_arr[$i] = <STDIN>;
	chomp $user_input_arr[$i];
	$i++;
}

foreach(@user_input_arr)
{
	my $len = length;
	my ($name) = $_ =~ /www\.(\w+)\.com/;
	$name =~ s/[aeiou]//g;
	my $jhool = length($name)+4;
	print $jhool.'/'.$len."\n";
}