## Usage

### Generate labels

* Command `./chip_label.prl -c 10k_1` will generate label for 10k-30k.
* Command `./chip_label.prl -a` will generate labels for all resistors in resistors_e24.yaml

### Print

`./print_png.prl -P Brother_PT-1230PC -w 6 out/10k_1.png`


## Prerequisites

### E Mode

This method only works with the 'extended' mode, switch the printer to 'extended' mode by flipping the switch at the back to 'E'.

### Add printer

In a web browser, open [http://localhost:631](http://localhost:631/) then add PT-1230PC in CUPS as an ASCII-printer ("Generic text-only printer")


