#!/usr/bin/perl
# Description:	a script for dealing 52 standard deck cards between 4 players
#		using multilevel data structures.
# Credits:	Dave, https://stackoverflow.com/questions/61748474/smart-formatting-of-print-output#answer-61750290

use strict;
use warnings;

use List::Util 'shuffle';

binmode STDOUT, ':utf8';

my @suits = qw[spades hearts diamonds clubs];

my %suit = (
  spades   => "\x{2660}",
  hearts   => "\x{2665}",
  diamonds => "\x{2666}",
  clubs    => "\x{2663}",
);

my @deck;
for my $s (keys %suit) {
  for my $c (2 .. 14) {
    push @deck, [$s, $c];
  }
}

@deck = shuffle @deck;

my %hand;

for (1 .. 13) {
  for my $p (qw[s w n e]) {
    my $card = shift @deck;

    push @{ $hand{$p}{$card->[0]} }, $card->[1];
  }
}

show1hand($hand{n});
show2hands($hand{w}, $hand{e});
show1hand($hand{s});

sub show1hand {
  my $hand = shift;

  for (@suits) {
    printf "%31s%s \n", 
      " ", 
      suit_hand($_, $hand->{$_});
  }
}

sub show2hands {
  my ($hand1, $hand2) = @_;

  for (@suits) {
    printf "%-31s%31s%s\n",
      suit_hand($_, $hand1->{$_}), 
      " ",
      suit_hand($_, $hand2->{$_}); 
  }
}

sub suit_hand {
  my ($suit, $cards) = @_;

  my %display = (11 => 'J', 12 => 'Q', 13 => 'K', 14 => 'A');

  my $card_str = defined($cards) ? # checks if there are any cards of given suit and hand                                              
                        join ' ', map { $display{$_} // $_ } sort { $b <=> $a } @$cards : 
                        '';

  return "$suit{$suit} $card_str";
}

