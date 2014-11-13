module PTouchPrint;
use strict;
use warnings;
use v5.10;

use PTouch qw/pixels/;

use fields qw/width cut mirror printer/;

my PTouchPrint $gself;

my %default_values = (
    cut => 0,
    width => undef,
    mirror => 0,
    printer => "Brother_PT-1230PC"
);

sub new {
    my $self = shift;
    $self = fields::new($self) unless ref $self;
    %$self = %default_values;
    hspace(1)->useFontConfig(1);
    return $self;
}

sub self {
    my $self = shift;
    return ($self,@_) if ref $self && $self->isa("PTouchOut");
    $gself = PTouchOut->new() if !defined $gself;
    return ($gself,@_);
}


