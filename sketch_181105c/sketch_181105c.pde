PShape s;

void setup() {
  size(500,500);
  background(255);
  s = loadShape("processingParse2.svg");
  s.disableStyle(); //
  /*
  fill(255,0,0);
  for(int i = 0 ; i <s.getChildCount(); i++){
    for(int j = 0; j < s.getChild(i).getVertexCount(); j++){
      println(s.getChild(i).getVertex(j));
    }
  }*/
}

void draw() {
  
  for(int i = 0 ; i <s.getChildCount(); i++){
    //noFill();
    fill(i*10,i*5,i*3);  //
    //stroke(1);
    shape(s.getChild(i),0,0);
  }
}
