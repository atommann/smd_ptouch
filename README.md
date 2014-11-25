## Intro

Use PT-1230PC label maker to print labels for chip resistors. Organize them in SMD sample books.

Photo: [labels for chip resistors](https://www.flickr.com/photos/atommann/15682989689/)

## Usage

### Generate labels

* Command `./smd_resistor_label.pl -f resistors_e24_0402.yaml -c 10k_1` will generate label for 10k-30k.
* Command `./smd_resistor_label.pl -f resistors_e24_0402.yaml -a` will generate labels for all resistors in resistors_e24_0402.yaml

### Print

`./print_png.pl -P Brother_PT-1230PC -w 6 out/10k_1.png`

## Prerequisites

### E Mode

This method only works with the 'extended' mode, switch the printer to 'extended' mode by flipping the switch at the back to 'E'.

### Add printer

In a web browser, open [http://localhost:631](http://localhost:631/) then add PT-1230PC in CUPS as an ASCII-printer ("Generic text-only printer").


## Authors

The code base was written by John Meacham, see [Label your chips](http://notanumber.net/archives/83/label-your-chips) for details.

Atommann adapted chip_label.pl to smd_resistor_label.pl to print labels for chip resistors.

