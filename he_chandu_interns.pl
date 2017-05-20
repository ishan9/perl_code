use strict;
use warnings;
use POSIX;

my ($test, @input);
chomp ($test = <STDIN>);
for(0..$test-1)
{
	chomp ($input[$_]= <STDIN>);
}
my $count;
foreach my $i (@input)
{
	if ($i==1 || $i==2 || $i==3 ||$i==4)
	{
		$count = 2;
	}
	else
	{
	if($i%2==0)
	{
		$count = 4;
	} 
	else
	{
		my $sqroot =ceil (sqrt $i);
		for(my $j=1 ;$j <= $sqroot; $j+=2)
		{
			
			if ($i % $j==0)
			{
				if($j == $sqroot)
				{
					$count++;
				}
				else
				{
					$count+=2;
				}
			}
			last if($count>=4);	
		}
	}
	}
	if ($count >= 4)
	{
		print "YES\n";
	}
	else
	{
		print "NO\n";
	}
	$count=0;
}