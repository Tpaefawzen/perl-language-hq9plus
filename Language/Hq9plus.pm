# Copyright (C) 2024 Tpaefawzen
#
# Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.


package Language::Hq9plus;

use strict; use warnings;

our $VERSION = '1.00';

sub new($) {
	my ($cls, $src) = @_;
	my $self = {
		src => $src,
		accum => 0,
	};

	bless $self, $cls;
	$self;
}

sub run {
	my $self = shift;
	foreach (split //, $self->{src}) {
		my %commands = (
			'H' => \&__hello,
			'Q' => \&__quine,
			'9' => \&__ninety_nine_bottles_of_beer,
			'+' => \&__increment,
		);
		my $cmd = $commands{$_};
		$cmd and $self->$cmd;
	}
}

sub __hello {
	print "Hello, world!\n";
}

sub __quine {
	my $self = shift;
	print $self->{src};
}

my $__99bb;
BEGIN {
	sub b {
		$_ = shift;
		sprintf "%s bottle%s of beer", ($_ || "no more"), ("s" x ($_ != 1));
	}

	if ( not defined $__99bb ) {
		for ( my $i = 99; $i >= 0; $i-- ) {
			my $b = b $i;
			my $B = $b; $B =~ s/^n/N/;
			$__99bb .= sprintf "%s on the wall, %s.\n", $B, $b;

			$B = "Go to the store and buy some more";
			$B = "Take one down and pass it around" if $i;
			$b = b (($i-1)%100);

			$__99bb .= sprintf "%s, %s on the wall.\n", $B, $b;
			$__99bb .= "\n" if $i;
		}

		undef &b;
	}
}

sub __ninety_nine_bottles_of_beer {
	print $__99bb;
}

sub __increment {
	my $self = shift;
	$self->{accum}++;
}

1;

=pod

=encoding UTF-8

=head1 NAME

Language::Hq9plus - HQ9+ Implementation

=head1 SYNOPSIS

    use Language::Hq9plus;
    my $program = "HHHHQQQQ9+++";
    my $hq9plus = new Language::Hq9plus($program);
    $hq9plus->run();
    print $hq9plus->{accum};

=head1 DESCRIPTION

HQ9+ implementation. Object-oriented.
Case-sensitive.

=head2 MEMBERS

=over

=item src

Given HQ9+ program source. A string.

=item accum

Accumulator. Default: 0. An integer.

=back

=head2 METHODS

=over

=item new($src)

Static method. Constructor. Load a program. $src is HQ9+ program source as a string.

=item run()

Run the loaded HQ9+ program. Returns nothing.
Use standard output.

=back

=head1 SEE ALSO

https://esolangs.org/wiki/HQ9+

=head1 AUTHOR AND COPYRIGHT

Copyright (C) 2024 Tpaefawzen

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

=cut
