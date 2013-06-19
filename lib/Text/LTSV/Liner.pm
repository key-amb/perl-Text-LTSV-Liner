package Text::LTSV::Liner;

use strict;
use warnings;

use Term::ANSIColor;

our $VERSION = "0.01";

sub new {
    my $class = shift;
    my %args  = @_;
    unless ($args{key}) {
        $args{all} = 1;
    }
    bless \%args, $class;
}

sub run {
    my $self = shift;
    my $line = shift;
    chomp($line);
    print $self->_parse_line($line) . "\n";
}

sub _parse_line {
    my $self = shift;
    my $line = shift;

    my %wants;
    if ($self->{key}) {
        %wants = map { $_ => 1 } @{$self->{key}};
    }

    my %stash;
    my @original;
    for my $kv ( map { [ split(/:/, $_, 2) ] } split(/\t/, $line) ) {
        next if (not $self->{all} and not $wants{$kv->[0]});
        $stash{$kv->[0]} = $kv->[1];
        push(@original, $kv->[0]);
    }

    my @out;
    my @ordered = $self->{key} ? @{$self->{key}} : @original;
    for my $_key (@ordered) {
        next unless $stash{$_key};
        my ($key, $value) = ($_key, $stash{$_key});
        if (not $self->{'no-color'}) {
            $key   = color('green')   . $key   . color('reset');
            $value = color('magenta') . $value . color('reset');
        }
        push(@out, join(q{:}, $key, $value));
    }

    return join("\t", @out);
}


1;
__END__

=encoding utf-8

=head1 NAME

Text::LTSV::Liner - It's new $module

=head1 SYNOPSIS

    use Text::LTSV::Liner;

=head1 DESCRIPTION

Text::LTSV::Liner is ...

=head1 LICENSE

Copyright (C) key-amb.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

key-amb E<lt>yasutake.kiyoshi@gmail.comE<gt>

=cut

