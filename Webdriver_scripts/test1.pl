use strict;
use warnings;
use Selenium::Remote::Driver;
use Data::Dumper;
use Test::More tests=>4;


my $driver = Selenium::Remote::Driver->new('port'=>'4444',
											'browser_name'=>'firefox',
											'extra_capabilities' => 
											 {'firefox_binary' => 'C:\Program Files\firefox_33\firefox.exe'},'auto_close' => '0');

my $get_result_url_script = q {
	var id = 'api_call_url';
	var text = document.getElementById(id).innerHTML;
	return text;
};
my $get_result = q {
	var span
}
my $element_call_method;
my $iframe;
my %result;
#my $stat = qq(//span[2]) ;
#my $code = qq(//span[4]);
#my $msg = qq(//span[6]);

my $call_method_button =qq(//*[\@value='Call Method...']);
my $format_json = qq(//select[\@name='format']/option[\@value='json-nc']);
my $element_format;
#my $iframe_win= qq(//iframe[contains(\@src, 'services/api/render')]);
#my $iframe_stat;
#my $api_call_url=api_call_url);

##TEST#1 
# Fill no argument
# Acceptance: Argument missing should be returned

$driver->get('https://www.flickr.com/services/api/explore/flickr.places.findByLatLon');
sleep (5);
$element_format = $driver->find_element($format_json);
$element_format->click;

$element_call_method=$driver->find_element($call_method_button);
$element_call_method->click;
sleep(5);
#my $element_api_url = $driver->find_element($api_call_url);

my $result_url = $driver->execute_script($get_result_url_script);
$result_url =~ s/<b>URL:<\/b> (https.*)/$1/;
$result_url =~ s/&amp;/&/g;
my $result_driver = Selenium::Remote::Driver->new('port'=>'4445',
											'browser_name'=>'firefox',
											'auto_close' => '0',
											'extra_capabilities' => 
											 {'firefox_binary' => 'C:\Program Files\firefox_33\firefox.exe'});										 
$result_driver->get("$result_url");
my $result_line = qq(//pre);
my $element_result_line = $result_driver->find_element($result_line);
my $final_text= $result_driver->get_text($element_result_line);
print $final_text;
sleep(1);





__END__
$result{'stat'} = $driver->get_text($driver->find_element($stat));
$result{'code'} = $driver->get_text($driver->find_element($code));
$result{'msg'} =  $driver->get_text($driver->find_element($msg));

print Dumper %result;

