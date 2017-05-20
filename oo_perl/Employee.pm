package Employee;

use strict;
use warnings;
use Person;

our @ISA= qw(Person);

sub new {
	my ($class) = @_;
	my $self= $class->SUPER::new($_[1], $_[2], $_[3]);
	$self->{_id} = undef;
	$self->{_title} = undef;
	bless $self, $class;
	return $self;
}

sub setId {
	my ($self, $id) = @_;
	$self->{_id}= $id;
	return $self->{_id};
}

sub setTitle {
	my ($self, $title) = @_;
	$self->{_title} = $title;
	return $self->{_title};
}

sub getId {
	my $self = shift;
	return $self->{_id};
}

sub getTitle {
	my $self = shift;
	return $self->{_title};
}

1;