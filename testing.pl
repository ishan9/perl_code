use strict;
use warnings;

my $test_case = <STDIN>;
my (@input_line1, @input_line2, @array, $N, $X, $i,$req);
for(1..$test_case)
{
	chomp ($input_line1[$_] = <STDIN>);
	chomp ($input_line2[$_] = <STDIN>);
}
$req =0;
for(1..$test_case)
{
	($N, $X) = split ' ', $input_line1[$_];
	@array = split ' ', $input_line2[$_];
	$req=0;
	for ($i=0;$i<=$N-2;$i++)
	{
		if ( $array[$i] >= $array[$i+1]) {
			my $z=find_add ($X, $array[$i], $array[$i+1]);
			$req += $z;
			$array[$i+1]+= ($X*$z);
	    }
      }
      print "$req\n";
}

sub find_add {
	my ($X, $m, $n) = @_;
	my $count = int(($m - $n)/$X) + 1;
	return $count;
}