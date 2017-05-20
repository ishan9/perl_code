use strict;
use warnings;

package fruit;

sub new {
	my $class = shift;
	my $self = {
		name => shift,
		color => shift
	};
	bless $self, $class;
	return $self;
}
1;