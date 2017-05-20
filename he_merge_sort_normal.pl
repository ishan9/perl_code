use strict;
use warnings;

chomp (my $testcases = <STDIN>);
my (@input1, @input2, @input3);
foreach(0..$testcases-1) {
	chomp ($input1[$_] = <STDIN>);
	chomp ($input2[$_] = <STDIN>);
	chomp ($input3[$_] = <STDIN>);
}

foreach(0..$testcases-1) {
	$input2[$_]= $input2[$_]." ".$input3[$_];
	my @arr = split " ", $input2[$_];
	@arr = sort {$b <=> $a} @arr;
	print @arr;
}