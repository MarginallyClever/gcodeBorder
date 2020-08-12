# gcodeBorder

Open the code in Processing.
Find the line 

    BufferedReader reader = createReader("test.ngc");

Change the part in the quotes ("") to your file name, or rename your file to test.ngc and put it in the same folder as the sketch.

Run the sketch.  Text output at the bottom of Processing will show progress.
If there's an IO error then a lot of red text will appear.

Once the scanning is done the sketch will write an output.ngc that draws a border around the limits of the gcode.