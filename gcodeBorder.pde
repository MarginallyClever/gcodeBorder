void setup() {
  println("Scanning");
  
  BufferedReader reader = createReader("test.ngc");
  String line;
  float minx = Float.MAX_VALUE;
  float miny = Float.MAX_VALUE;
  float maxx = -Float.MAX_VALUE;
  float maxy = -Float.MAX_VALUE;
  int linesRead=0;
  try {
    while((line = reader.readLine())!=null) {
      ++linesRead;
      String[] parts = line.split("\\s+");
      print(linesRead+": "+parts.length+" parts");
      for(String p : parts) {
        if(p.startsWith("X")) {
          float x = Float.parseFloat(p.substring(1));
          print(" X="+x);
          maxx = max(maxx,x);
          minx = min(minx,x);
        }
        if(p.startsWith("Y")) {
          float y = Float.parseFloat(p.substring(1));
          print(" Y="+y);
          maxy = max(maxy,y);
          miny = min(miny,y);
        }
      }
      println();
    }
  }
  catch(IOException e) {
    e.printStackTrace();
  }
  
  println(linesRead+" lines read.");
  println("Found ("+minx+","+miny+")-("+maxx+","+maxy+")");
  println("Writing");
  PrintWriter writer = createWriter("output.ngc");
  writer.println("G0 Z90;");  // pen up
  writer.println("G0 X-10 Y20");  // p1
  writer.println("G0 Z40;");  // pen down
  writer.println("G0 X30 Y20;");  // p2
  writer.println("G0 X30 Y-40;");  // p3 
  writer.println("G0 X-10 Y-40;");  // p4 
  writer.println("G0 X-10 Y20;");  // p1 again
  writer.println("G0 Z90;");  // pen up
  writer.flush();
  writer.close();
  println("Done.");
}
