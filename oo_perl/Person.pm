package Person;

sub new {
	my $class = shift;
	my $self =  {
		_firstName => shift,
		_lastName => shift,
		_atrib => shift,
	};
	bless $self, $class;
	return $self;
}

sub getFirstname {
	my ($self) = @_;
	return $self->{_firstName};
}

sub getLastname {
	my ($self) = @_;
	return $self->{_lastName};
}

sub getAtrib {
	my ($self) = @_;
	return $self->{_atrib};
}
1;
