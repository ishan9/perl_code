#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

use strict;
use warnings;
my ($T, @ip2, @ip3, @ip4, @answer);

chomp ($T = <STDIN>);

for my $t (0..$T-1)
{
	chomp ($ip2[$t] = <STDIN>);
	chomp ($ip3[$t] = <STDIN>);
	chomp ($ip4[$t] = <STDIN>);
}
for my $t (0..$T-1)
{
    my $flag = 0;
    my ($i, $j);
	my ($ns, $nh) = split " ", $ip2[$t];
	my @strength = split " ", $ip3[$t]; 
	my @hurdle = split " ", $ip4[$t];
	my %hash_st;
	
	die "ERROR" if($ns != (scalar @strength));
    die "ERROR" if($nh != (scalar @hurdle));
	for (0..$ns-1)
	{
	next if(exists $hash_st{$strength[$_]}) ;
	$hash_st{$strength[$_]} = $_;
	}
	#print Dumper (\%rev_hash);
	@strength = ();
	my @st = sort {$a<=>$b}keys %hash_st;
    @hurdle = sort {$a<=>$b} @hurdle;
	my $nsr = @st;
	if ($st[$nsr-1]<$hurdle[0])
	{
		print "0\n";
		next;
	}
	$i=0;
	$j=0;
	my $max=0;
	my %hash_ct;	
	for $i (0..$nsr-1)
	{
		$hash_ct{$st[$i]}=$nh;
		for $j (0..$nh-1)
		{
			if($st[$i]<$hurdle[$j])
			{
			$hash_ct{$st[$i]}--;
			}
		}
		if($max<$hash_ct{$st[$i]})
		{
			$max= $hash_ct{$st[$i]};
		}
	}
	my %rev_hash = reverse %hash_st;
	foreach my $id (sort keys %rev_hash)
	{
		if ($hash_ct{$rev_hash{$id}}==$max)
		{
			print "$id\n";
			last;
		}
	}
}
