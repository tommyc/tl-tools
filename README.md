# tl-tools
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
Quick hack to select 1 image per hour from a long term timelapse.

This [branch](https://github.com/tommyc/tl-tools/tree/refactor) has the refactored version.
=======
Quick hack to select 1 image per hour from a long term timelapse

The images are organized into directories by year, month and day
>>>>>>> misc fixes
=======
Refactoring of my quick hack to select 1 image per hour from a long term timelapse
based on certain criteria.

The images are organized into directories by year, month and day
=======
Refactoring of my quick hack to select images from a long term timelapse
based on certain criteria.
The timelapse has run for almost two years and contains over 300gb of images.

The images are organized into directories by year, month and day
>>>>>>> update readme

Basic operation:
* read config file
* add in additional options if present
* call ImageProcessor.process
* iterate through image directories
* rename and write out new image if image meets criteria

TODO:
<<<<<<< HEAD
<<<<<<< HEAD
* more refactoring
* fix failing specs when running `rspec`. specs pass if run individually
* research picking images based on pixel values instead of exif values
>>>>>>> update readme
=======
* more refactoring an cleanup
=======
* more refactoring and cleanup
>>>>>>> misc updates to readme
* fix failing specs when running `rspec`. specs pass if run individually
* research picking images based on pixel values instead of exif values
>>>>>>> update readme
