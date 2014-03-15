# NAME

Text::LTSV::Liner - Line filter of LTSV text

# SYNOPSIS

    use Text::LTSV::Liner;
    my $liner = Text::LTSV::Liner->new( key => \@keys );
    while(<>) {
        $liner->run($_);
    }

# DESCRIPTION

Labeled Tab-separated Values (LTSV) format is a variant of Tab-separated
Values (TSV). (cf: [http://ltsv.org/](http://ltsv.org/))
This module simply filters text whose format is LTSV by specified keys.

# AUTHORS

YASUTAKE Kiyoshi <yasutake.kiyoshi@gmail.com>

# LICENSE

Copyright (C) 2013 YASUTAKE Kiyoshi.

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.  That means either (a) the GNU General Public
License or (b) the Artistic License.
