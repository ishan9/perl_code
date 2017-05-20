use strict;
use warnings;
use Data::Dump qw(dump);
my ($swaps, $input1, $line, %hash);

chomp ($swaps = <STDIN>);

for(0..$swaps-1)
{
	chomp ($input1=<STDIN>);
	my ($a, $b) = split ' ', $input1;
	my ($v1, $v2);
	$v1 = $hash{$a} || undef;
	$v2 = $hash{$b} || undef;
	if (defined $v1 )
	{	
		my $tmp = $hash{$v1};
		if (defined $v2)
		 {
		 	$hash{$v1} = $hash{$v2};
		 	$hash{$v2} = $tmp; 
		 }
		 else
		 {
		 	$hash{$v1} = $b;
		 	$hash{$b} = $tmp;
		 }
	}
	elsif (defined $v2)
	{
		my $tmp = $hash{$v2};
		$hash{$v2} = $a;
		$hash{$a} = $tmp;
	}
	else
	{
		$hash{$a} = $b;
		$hash{$b} = $a;
	}
}
 #print dump \%hash;
chomp ($line =<STDIN>);
 my $out = 'C:\TEMP\log2.txt';
open (my $outf , '>' , $out);
my @char_arr = split '', $line;
#print dump \@char_arr;
my $count = @char_arr;
for(my $i= 0; $i<$count; $i++)
{
	my $uc_char = uc $char_arr[$i]; 
	if ($char_arr[$i] eq $uc_char)
	{
	if (exists $hash{$char_arr[$i]})
	{
		$char_arr[$i] = $hash{$char_arr[$i]};
		print $outf $char_arr[$i];
	}
	}
	else {
		if (exists $hash{$uc_char})
		{
			$char_arr[$i] = lc $hash{$uc_char};
			print $outf $char_arr[$i];
		}
	}
}



