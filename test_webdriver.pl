use Selenium::Remote::Driver;
use JSON::Parse 'parse_json';

my $driver = new Selenium::Remote::Driver;
my $address = 'https://www.flickr.com/services/api/explore/flickr.places.findByLatLon'; 
$driver->get($address);

my $locator_lat = "//input[\@id='param_lat']";
my $locator_lon = "//input[\@id='param_lon']";
my $locator_acc = "//input[\@id='param_accuracy']";
my $locator_call_btn = "//*[\@value='Call Method...']";
my $locator_output = "//*[\@name='format']/option[\@value='json-nc']";
my $locator_return = 'html/body/pre';
my $handles = $driver->get_window_handles;
my $text;
my $hash_ref = parse_json($text);
print $hash_ref->[0];
__END__

#my $element_acc=$driver->find_element($locator_acc);
my $element_output = $driver->find_element($locator_output);
my $element_call = $driver->find_element($locator_call_btn);
my $element_return;
my $element_frame;
#test#1
#all fields empty
$element_output->click();
$element_call->click();
sleep 10;
$element_frame = $driver->switch_to_frame(0);
$element_return = $driver->find_element($locator_return);
$text = $element_return->get_text();
print $te


sleep 10;

$driver->switch_to_frame();


#test#2
#only latitude field
my $element_lat=$driver->find_element($locator_lat);
$element_lat->send_keys('120');
$element_output = $driver->find_element($locator_output);
$element_call = $driver->find_element($locator_call_btn);
$element_output->click();
$element_call->click();
sleep 10;
$element_frame = $driver->switch_to_frame(0);
$element_return = $driver->find_element($locator_return);
$text = $element_return->get_text();
print $text;

sleep 10;

$driver->switch_to_frame();


#test#3
#only longitude field
$element_lon=$driver->find_element($locator_lon);
$element_lon->send_keys('120');
$element_output = $driver->find_element($locator_output);
$element_call = $driver->find_element($locator_call_btn);
$element_output->click();
$element_call->click();
sleep 10;
$element_frame = $driver->switch_to_frame(0);
$element_return = $driver->find_element($locator_return);
$text = $element_return->get_text();
print $text;

sleep 10;

$driver->switch_to_frame();