#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Long qw(:config no_ignore_case pass_through);
use Text::LTSV::Liner;

GetOptions(
    'k|key=s'  => \my @_keys,
    'no-color' => \my $no_color,
);

my @keys = map { split ',' } @_keys;

my %args = ( 'no-color' => $no_color );

if ( scalar(@keys) ) {
    $args{key} = \@keys;
}

my $liner = Text::LTSV::Liner->new(%args);

while (<>) {
    $liner->run($_);
}

__END__

=head1 NAME

ltsvl.pl - Line filter of LTSV text

=head1 SYNOPSIS

    $ cat /path/to/yourtext.ltsv | ltsvl.pl -k host,time,status

=head1 DESCRIPTION

Labeled Tab-separated Values (LTSV) format is a variant of Tab-separated
Values (TSV). (cf: L<http://ltsv.org/>)
This script simply filters text whose format is LTSV by specified keys.

=head1 AUTHORS

YASUTAKE Kiyoshi E<lt>yasutake.kiyoshi@gmail.com<gt>

=head1 LICENSE

Copyright (C) 2013 YASUTAKE Kiyoshi.

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.  That means either (a) the GNU General Public
License or (b) the Artistic License.

=head1 SEE ALSO

L<Text::LTSV::Liner>

=cut

