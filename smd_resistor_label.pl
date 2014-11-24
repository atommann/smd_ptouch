#!/usr/bin/perl
use strict;
use warnings;

use GD;
use Getopt::Long qw/:config auto_help gnu_getopt bundling/;
use Pod::Usage;
use List::Util qw/max min/;
use Data::Dumper;

use GdUtil qw/:all/;
use PTouch qw/pixels PIX_PER_MM/;
use YAML;

my $outfile;

# tape width in mm
my $tapewidth = 6;
# my $tapewidth = 12;
my $pin_spacing = 2.54; # mm
my $offset = 1.0; # mm
my $force = 0;
my $all = 0;
my $chip;

GetOptions(
    "w=n" => \$tapewidth,  # width of tape
    "o=s" => \$outfile,
    "force" => \$force,
    "c=s" => \$chip,
    "a" => \$all,
    ) or die "invalid options";

my $yaml = YAML::LoadFile("resistors_e24.yaml") or die "couldn't read resistors_e24.yaml";
my $height = pixels($tapewidth);

# my $thickness = 1;
my $ptsize = 20;

sub genstrip {
    my ($ch) = @_;

    my @resistors = @{$yaml->{$ch}};
    my $string = join( ' ', @resistors ); # put a space between each value

    my $canvas = GD::Image->new(10, $height); # create an image to enable useFontConfig
    $canvas->useFontConfig(1);

    # my $nc = drawtext($string, font => GD::Font->Giant);  # gd monospace font
    my $nc = drawtext($string, font => 'DejaVu Sans', size => $ptsize);      # TTF font
    my ($tw,$th) = $nc->getBounds();        # get the dim of the string image
    $canvas = GD::Image->new($tw, $height); # update the image size
    my $bg = $canvas->colorAllocate(255,255,255); # black on white
    my $fg = $canvas->colorAllocate(0,0,0);

    $canvas->copy($nc,0,($height - $th)/2,0,0,$tw,$th); # put text on canvas

    writepng($canvas , lc "out/$ch.png");
}

genstrip($chip) if $chip;

if ($all) {
    genstrip($_) foreach keys %$yaml;
}

__END__

=head1 SYNOPSIS

 Options:
   --help            brief help message
   -w n              specify tape width in mm
   -c chip           chip name as specified in chips.yaml
   -a                generate pngs for all chips in the file

output placed in out/ directory.
