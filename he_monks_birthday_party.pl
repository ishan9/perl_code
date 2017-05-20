use strict;
use warnings;
my ($tests,$input_count, $input);
my %output;

chomp ($tests = <STDIN>);

for(0..$tests-1)
{
	chomp ($input_count = <STDIN>);
	my (%hash, @arr, $input);
	for my $i (0..$input_count-1)
	{
		chomp ($input = <STDIN>);
		$input = lc $input;
		next if (exists $hash{$input});
		$hash{$input} = 1;
	}
		@arr= sort keys %hash;
		$output{$_} = \@arr;
}
for(0..$tests-1)
{
	my @arr= @{$output{$_}};
	foreach(@arr)
	{
		print "$_\n";
	}
}