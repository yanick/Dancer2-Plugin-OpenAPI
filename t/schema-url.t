use Test2::V0;
use  Test::WWW::Mechanize::PSGI;
use JSON qw/ from_json /;

package MyApp {
    use Dancer2;
    use Dancer2::Plugin::OpenAPI;

    our $VERSION = '6.1.3';

    set serializer => 'JSON';

}

my $app = MyApp->to_app;
my $mech = Test::WWW::Mechanize::PSGI->new( app => $app );

my $resp =$mech->get('/openapi.json');
ok $resp->is_success, "/openapi.json exists";

my $body = from_json $resp->content;

is $body->{info}{version} => '6.1.3';
is $body->{info}{title} => 'MyApp';

done_testing;
