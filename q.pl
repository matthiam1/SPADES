#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use List::Util qw(shuffle); 
use utf8;
binmode (STDOUT, ":utf8");

my %deck = (
	0 => "A", 1 => "K", 2 => "Q", 3 => "J", 4 => "10", 5 => "9", 6 => "8",
	7 => "7", 8 => "6", 9 => "5", 10 => "4", 11 => "3", 12 => "2",
	13 => "A", 14 => "K", 15 => "Q", 16 => "J", 17 => "10", 18 => "9", 19 => "8",
	20 => "7", 21 => "6", 22 => "5", 23 => "4", 24 => "3", 25 => "2",
	26 => "A", 27 => "K", 28 => "Q", 29 => "J", 30 => "10", 31 => "9", 32 => "8",
	33 => "7", 34 => "6", 35 => "5", 36 => "4", 37 => "3", 38 => "2",
	39 => "A", 40 => "K", 41 => "Q", 42 => "J", 43 => "10", 44 => "9", 45 => "8",
	46 => "7", 47 => "6", 48 => "5", 49 => "4", 50 => "3", 51 => "2" );

my $x;
my @decksh = shuffle(keys(%deck));
my (@ss,@sh,@sd,@sc,@ws,@wh,@wd,@wc,@ns,@nh,@nd,@nc,@es,@eh,@ed,@ec);

for ($x = 0; $x < 13; $x++) {
	my $ca = shift @decksh;
	push @ss, $ca if ($ca >= 0 and $ca<= 12); 
	push @sh, $ca if ($ca >= 13 and $ca<= 25);
	push @sd, $ca if ($ca >= 26 and $ca<= 38);
	push @sc, $ca if ($ca >= 39 and $ca<= 51);

	$ca = shift @decksh;
	push @ws, $ca if ($ca >= 0 and $ca<= 12);
	push @wh, $ca if ($ca >= 13 and $ca<= 25);
	push @wd, $ca if ($ca >= 26 and $ca<= 38);
	push @wc, $ca if ($ca >= 39 and $ca<= 51);

	$ca = shift @decksh;
	push @ns, $ca if ($ca >= 0 and $ca<= 12);
	push @nh, $ca if ($ca >= 13 and $ca<= 25);
	push @nd, $ca if ($ca >= 26 and $ca<= 38);
	push @nc, $ca if ($ca >= 39 and $ca<= 51);

	$ca = shift @decksh;
	push @es, $ca if ($ca >= 0 and $ca<= 12);
	push @eh, $ca if ($ca >= 13 and $ca<= 25);
	push @ed, $ca if ($ca >= 26 and $ca<= 38);
	push @ec, $ca if ($ca >= 39 and $ca<= 51);
}	

print "\t\t\t\x{2660} "; print $deck{$_}," " foreach (sort {$a <=> $b} @ns); print "\n";
print "\t\t\t\x{2665} "; print $deck{$_}," " foreach (sort {$a <=> $b} @nh); print "\n";
print "\t\t\t\x{2666} "; print $deck{$_}," " foreach (sort {$a <=> $b} @nd); print "\n";
print "\t\t\t\x{2663} "; print $deck{$_}," " foreach (sort {$a <=> $b} @nc); print "\n";
print "\x{2660} "; print $deck{$_}," " foreach (sort {$a <=> $b} @ws); print "\n";
print "\x{2665} "; print $deck{$_}," " foreach (sort {$a <=> $b} @wh); print "\n";
print "\x{2666} "; print $deck{$_}," " foreach (sort {$a <=> $b} @wd); print "\n";
print "\x{2663} "; print $deck{$_}," " foreach (sort {$a <=> $b} @wc); print "\n";
print "\t\t\t\t\t\t\x{2660} "; print $deck{$_}," " foreach (sort {$a <=> $b} @es); print "\n";
print "\t\t\t\t\t\t\x{2665} "; print $deck{$_}," " foreach (sort {$a <=> $b} @eh); print "\n";
print "\t\t\t\t\t\t\x{2666} "; print $deck{$_}," " foreach (sort {$a <=> $b} @ed); print "\n";
print "\t\t\t\t\t\t\x{2663} "; print $deck{$_}," " foreach (sort {$a <=> $b} @ec); print "\n";
print "\t\t\t\x{2660} "; print $deck{$_}," " foreach (sort {$a <=> $b} @ss); print "\n";
print "\t\t\t\x{2665} "; print $deck{$_}," " foreach (sort {$a <=> $b} @sh); print "\n";
print "\t\t\t\x{2666} "; print $deck{$_}," " foreach (sort {$a <=> $b} @sd); print "\n";
print "\t\t\t\x{2663} "; print $deck{$_}," " foreach (sort {$a <=> $b} @sc); print "\n";

