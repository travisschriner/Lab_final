Lab_final
=========

This lab is the culminating lab for ECE 383. I will attempt to utilize everything taught in the course to derive my functionality. I will be creating a Graphic Equilizer using the MSGEQ7 chip from sparkfun.com. The block diagram and pinout is as follows:

!(MSGEQ7 Block Diagram.JPG)[MSGEQ7 Block Diagram]

!(MSGEQ7_pinout.JPG)[MSGEQ7 Pinout]

Using the VGA controller we developed in Lab 1, I will be placing a bar graph representing voltage levels of different frequency levels on the desktop monitor display. I will use the skills taught in Lab 2 to make the bar graph update with the v_pulse signal. This will allow me to show a real time feed of what the voltage levels of the different frequency bands for the given input source look like. Lab 3 was mostly about timing signals to make sure different parts received the correct signals at the correct time. Due to the way the MSGEQ7 chip is built, timing will be very important. As the following diagram shows, I have very tight tolerances to get my chip to reset and output correctly.

!(MSGEQ7_timing_diagram.JPG)[]


