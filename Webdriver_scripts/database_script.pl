use DBI;
use strict;

my $driver = "mysql"; 
my $database = "test";
my $dsn = "DBI:$driver:database=$database";
my $userid = "root";
my $password = "admin1!";

my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
my $sth;
# $sth = $dbh->prepare("INSERT INTO user_info (uid,upass) values ('balu', 'admin2!')");
#$sth->execute() || die $DBI::errstr;
#$sth->finish();


$sth = $dbh->prepare("SELECT * FROM user_info");
$sth->execute();

print "Number of rows found :".$sth->rows."\n";
while (my @row = $sth->fetchrow_array()) {
   my ($user_name, $user_password ) = @row;
   print "User Name = $user_name, Password = $user_password\n";
}
$sth->finish();
