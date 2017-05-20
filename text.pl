use Text::Template;
use Data::Dumper;

my $template = Text::Template->new(TYPE=> 'FILE', SOURCE => 'test.tmpl');
my %hf_hash = (
                0 => {
                       0 =>'helloc.t' ,1 => '5', 2 => '57580'
                     }, 
	            1 => { 
                       0 => 'malloc.t', 1 => '7', 2 => '59919'
                     }
	   );
my $hash = \%hf_hash;

#print Dumper(%hash);


my $result = $template->fill_in(HASH => $hash);

print $result;