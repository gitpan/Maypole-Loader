package Maypole::Loader;

use strict;

our $VERSION = '0.1';

=head1 NAME

Maypole::Loader - Require all available model class modules

=head1 SYNOPSIS

    package BeerDB;

    use base qw(Apache::MVC Maypole::Loader);

    BeerDB->setup('dbi:Pg:dbname=beerdb', 'myuser', 'mypass');
    BeerDB->load_model_classes;

=head1 DESCRIPTION

Requires all available model class modules for you.

So you can just do this:

    package BeerDB;

    use base qw(Apache::MVC Maypole::Loader);

    BeerDB->setup('dbi:Pg:dbname=beerdb', 'myuser', 'mypass');
    BeerDB->load_model_classes;

Instead of this:

    package BeerDB;

    use base qw(Apache::MVC);

    BeerDB->setup('dbi:Pg:dbname=beerdb', 'myuser', 'mypass');
    BeerDB::Brewery->require;
    BeerDB::Beer->require;
    BeerDB::Handpump->require;
    BeerDB::Pub->require;

=cut

# serious, this is everything! :)
sub load_model_classes { $_->require for @{ shift->config->{classes} } }

=head1 AUTHOR

Sebastian Riedel, C<sri@oook.de>

=head1 LICENSE

This library is free software. You can redistribute it and/or modify it under
the same terms as perl itself.

=cut

1;
