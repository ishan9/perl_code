use strict;
use warnings;
use Data::Dumper;
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
	
my @str = (1,2,3,4,5,6,7);
my @hur = (1, 2, 1, 5, 8);
my $nstr = @str; 
my %st = %{myuniq(\@str, $nstr)};
my @strength = sort {$a<=>$b} keys %st;
@hur = sort {$a<=>$b} @hur;
my $ns = @strength;
my $nh = @hur;
my $max_str = $strength[$ns-1];
my $max_count= find_count(\@hur, $nh, $max_str);

my $element_str = find(\@strength, \@hur,$ns, $nh, $max_count);

print "$st{$element_str}";


__END__
my $yo = '50 10 20 10 20';
my %hash;
my @arr = split " ", $yo;
for (0..3)
{
	next if(exists $hash{$arr[$_]}) ;
	$hash{$arr[$_]} = $_;
}

print Dumper (\%hash);

my @strength = keys %hash;
my @ids = values %hash;

print Dumper (\@strength);
print Dumper (\@ids);
 