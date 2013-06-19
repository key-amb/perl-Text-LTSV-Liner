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

my %args = (
        'no-color' => $no_color
    );

if (scalar(@keys)) {
    $args{key} = \@keys;
}

my $liner = Text::LTSV::Liner->new(%args);

while (<>) {
    $liner->run($_);
}

