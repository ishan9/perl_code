use strict;
use warnings;
use Employee;

my $ob = new Employee('Ishan', 'Sood', 'Chutiya');
$ob->setId(19);
$ob->setTitle('Yo');

print $ob->getFirstname;
print $ob->getLastname;
print $ob->getAtrib;
print $ob->getId;
print $ob->getTitle;

