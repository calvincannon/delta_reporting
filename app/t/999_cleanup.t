use lib './lib';
use Test::More;
use Test::Mojo;
use Storable;
use strict;
use warnings;

my $shared = retrieve( '/tmp/delta_reporting_test_data' );

my $t = Test::Mojo->new( 'DeltaR' );

ok( $t->app->config->{db_name} eq 'delta_reporting_test', 'Confirm config test database' )
   or BAIL_OUT( "Config test failed" );

ok( $t->app->dw->drop_tables, 'Drop tables in test database' );

ok( unlink "$shared->{data}{config}", 'Remove test config file' );
ok( unlink '/tmp/delta_reporting_test_data', 'Clean up log file' );

done_testing();

=pod

=head1 SYNOPSIS

This file cleans up temp files used for testing.

=head1 LICENSE

Delta Reporting is a central server compliance log that uses CFEngine.

Copyright (C) 2016 Neil H. Watson http://watson-wilson.ca

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
=cut
