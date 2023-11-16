use Test2::V0;
use  Test::WWW::Mechanize::PSGI;

package MyApp {
    use Dancer2;
    use Dancer2::Plugin::OpenAPI;

    set serializer => 'JSON';

}

my $app = MyApp->to_app;
my $mech = Test::WWW::Mechanize::PSGI->new( app => $app );

ok $mech->get('/openapi.json')->is_success, "/openapi.json exists";

done_testing;
