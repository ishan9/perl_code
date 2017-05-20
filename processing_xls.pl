use strict;
use warnings;
use Data::Dump qw(dump);
use Spreadsheet::Read;

my $filename= 'C:\Users\Admin\Desktop\Book1.xlsx';

my $book  = ReadData ($filename);

my $row_max = $book->[1]{maxrow};
print $row_max;
my $read_flag=0;
my $i;
my %hash;
my $count=1;
my $acc_no;
for ($i =1 ; $i<= $row_max; $i++)
{
	
	my $cell = $book->[1]{cell}[1][$i];
	if (defined($cell))
	{
		chomp $cell;
		if ($cell =~ /A\/C NO: (\w+)/)
		{
			#$read_flag=1;
			$acc_no=$1;
	#		$hash{$acc_no}{comment}= "present sir";
			#print "$cell\n";
		}
		if ($cell =~/Int.Coll/)
		{
			$a= $cell;
			$a =~ s/\s+/ /g;
			my @array = split ' ', $a;
			if ($array[0] eq '30-09-2014')
			{
				$hash{$acc_no}{sep_int} = $array[5];
			}
		elsif ($array[0] eq '31-03-2015')
		    {
		    	$hash{$acc_no}{mar_int} = $array[5];
		    }
		else 
			{
				#do nothing;
			}
		}
		
	}

}
dump(%hash);
#my ($row_min, $row_max) = $book->row_range();

#my $cell  = $book->[1]{cell}[1][15];

#print "$cell";
 