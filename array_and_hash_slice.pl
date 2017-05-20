use strict;
use warnings;
use Data::Dump qw (dump);
#################
#HASH SHORTHANDS
#################

my %hash  = qw(dog woof cat meow);


#$hash{"mouse"} = "arriba";
#$hash{"bird"} = "chrip";
# assigning shorthand below
@hash{"mouse", "bird"} = ("arriba", "chrip");

#accessing shorthand below
#my @sounds =  @hash{"dog" , "cat", "mouse", "bird"};
#or below
my @sounds = @hash {qw (dog cat mouse bird)};
print "@sounds";
print "\n";

#################
#ARRAY SHORTHANDS
#################
my @arr = qw (ishan ashish);
@arr[2..4] = qw(rahul ajay varun);
@arr[0,1] = qw (ashish ishan);
print "@arr";

################
#List Flatening
################
print "\n";
my @list = (1,2,3, (5,6));
print dump @list;

#######################
#Storing as array ref
#######################
print "\n";
my $list_arr_ref = [1,2,3,[6,7]];
print dump $list_arr_ref->[3];
