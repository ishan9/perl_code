#!/usr/bin/perl
use strict;
use warnings;
use POSIX;

sub myuniq {
	my ($aref,$n) = @_;
	my %hash;
	for (0..$n-1)
	{
		next if(exists $hash{$aref->[$_]});
		$hash{$aref->[$_]} = $_;
	}
	return (\%hash);
}

sub find_count {
	my ($hurdle_ref, $nh, $element) = @_;
	my $count =$nh;
	for (my $i=$nh-1;$i>=0;$i--)
	{
		if ($element < $hurdle_ref->[$i])
		{
			$count--;
		}
	}
	return $count;
}
sub find {
	my ($st_ref ,$hur_ref, $ns, $nh, $count_ex) = @_;
	my ($mid, $count);
	my $high = $ns-1;
	my $low = 0;
	my $flag=1;
	do {
		$mid = ceil (($high+$low)/2);
		$count = find_count($hur_ref, $nh, $st_ref->[$mid]);
		if ($count < $count_ex)
		{
			$low = $mid;
		}
		elsif ($count > $count_ex)
		{
			$high = $mid;
		}
		else 
		{
		$flag=0;	
		}
	}while($flag!=0);
	while(1)
	{ 
		$mid--;
		$count = find_count($hur_ref, $nh, $st_ref->[$mid]);
		last if( $count < $count_ex);
		next if( $count == $count_ex);
	}
	return $st_ref->[++$mid];
}

my ($T, @ip2, @ip3, @ip4, @answer);

chomp ($T = <STDIN>);

for my $t (0..$T-1)
{
	chomp ($ip2[$t] = <STDIN>);
	chomp ($ip3[$t] = <STDIN>);
	chomp ($ip4[$t] = <STDIN>);
}
#    my $flag = 1; 
#    my ($i, $j);
#	my ($ns, $nh) = split " ", $ip2[$t];
#	my @strength = split " ", $ip3[$t]; 
#	my @hurdle = split " ", $ip4[$t];
#	die "ERROR" if($ns != (scalar @strength));
#	die "ERROR" if($nh != (scalar @hurdle));
#	@hurdle = sort {$a<=>$b} @hurdle;
#	my @strength_max = sort {$a<=>$b} @strength;
#	if ($strength_max[$ns-1] < $hurdle[0] || $strength_max[0]== $strength_max[$ns-1]||$strength_max[0] > $hurdle[0])
#	{
#		$answer[$t]=0;
#	}
#	else
#	{
#		my %st = %{myuniq(\@strength_max, $ns)};
#		my @st_r = sort {$a<=>$b} keys %st; 
#		my $nstr = @st_r;
#		my $max_str = $strength_max[$ns-1];
#		my $max_count= find_count(\@hurdle, $nh, $max_str);
#		my $element_str = find(\@st_r, \@hurdle ,$nstr, $nh, $max_count);
#		$answer[$t] = "$st{$element_str}";
#	}

#}
#
#for(0..$T-1)
#{
#	print $answer[$_]."\n";
#}