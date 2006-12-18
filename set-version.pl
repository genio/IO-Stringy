#!/usr/bin/perl
#
# Fix up the version numbers on all subsidiary modules.  Meant for
# internal developer use.
#
# $Id: set-version.pl,v 1.1 2005/02/10 19:38:36 dfs Exp $

use strict;

sub fix_version($$) {
    my($fname, $version) = @_;

    my $didit = 0;

    # Ignore main file!
    if ($fname eq "lib/IO/Scalar.pm") {
	return;
    }

    open(IN, "<$fname") or die("Can't open $fname for input: $!");
    open(OUT, ">$fname.new") or die("Can't open $fname.new for output: $!");
    while(<IN>) {
	if (/^\$VERSION =/) {
	    if ($_ eq "\$VERSION = \"$version\";\n") {
		print STDERR "No need to update $fname -- already at $version\n";
		print OUT;
	    } else {
		$didit = 1;
		print STDERR "Updated VERSION in $fname\n";
		print OUT "\$VERSION = \"$version\";\n";
	    }
	} else {
	    print OUT;
	}
    }
    close(IN);
    close(OUT);
    if ($didit) {
	rename("$fname.new", "$fname") or die("Can't rename $fname.new to $fname: $!");
    } else {
	unlink("$fname.new");
    }
}

do './lib/IO/Scalar.pm';
my $version = $IO::Scalar::VERSION;

open(FIND, "find lib/IO -name '*.pm'|");
while(<FIND>) {
    chomp;
    fix_version($_, $version);
}
close(FIND);
