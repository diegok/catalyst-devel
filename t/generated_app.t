use strict;
use warnings;

use File::Temp qw/ tempdir /;

my $dir = tempdir(); # CLEANUP => 1 );

use Test::More;
{
    # Check exit status here
    system("cd $dir; catalyst.pl TestApp");
}
# Fix paths / nl work on win32
chdir("$dir/TestApp/");
warn($dir);

# Ok, this is lame.. Also, check +x permissions?
my @files = qw|
    Makefile.PL
    testapp.conf
lib/TestApp.pm
lib/TestApp/Controller/Root.pm
README
Changes
t/01app.t
t/02pod.t
t/03podcoverage.t
root/static/images/catalyst_logo.png
root/static/images/btn_120x50_built.png
root/static/images/btn_120x50_built_shadow.png
root/static/images/btn_120x50_powered.png
root/static/images/btn_120x50_powered_shadow.png
root/static/images/btn_88x31_built.png
root/static/images/btn_88x31_built_shadow.png
root/static/images/btn_88x31_powered.png
root/static/images/btn_88x31_powered_shadow.png
root/favicon.ico
Makefile.PL
script/testapp_cgi.pl
script/testapp_fastcgi.pl
script/testapp_server.pl
script/testapp_test.pl
script/testapp_create.pl
|;

plan 'tests' => scalar @files;

foreach my $fn (@files) {
    ok -r $fn, "Have $fn in generated app";
}

