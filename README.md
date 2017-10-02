# tl-tools
Refactoring of my quick hack to select images from a long term timelapse
based on certain criteria.
The timelapse has run for almost two years and contains over 300gb of images.

The images are organized into directories by year, month and day

Basic operation:
* read config file
* add in additional options if present
* call ImageProcessor.process
* iterate through image directories
* dynamically build criteria based on options
* rename and write out new image if image meets criteria

TODO:
* more refactoring and cleanup
* fix failing specs when running `rspec`. specs pass if run individually
* research picking images based on pixel values instead of exif values
