use strict;
use warnings;

my $FruitDB = {
	FruitA => {
		name      => 'Apple',
		quantity  => 10,
		price     => 500
	},
	FruitB => {
		name      => 'Banana',
		quantity  => 20,
		price     => 400
	}
};

my $FruitDBClone = $FruitDB;
print "FruitDB is of type:".ref($FruitDB);
print "\nFruitDBClone is of type:".ref($FruitDBClone);

bless ($FruitDB, "Fruit");

print "\nFruitDB is of type:".ref($FruitDB);
print "\nFruitDBClone is of type:".ref($FruitDBClone);
