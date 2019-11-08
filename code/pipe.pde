public float w = 100;
float spacing = 125;
class pipe {
  float top = random(height/2);
  float x = width;
  float c = 255;
  
  
  void show() {

    fill(c);  
    rect(x, 0, w, top); 
    rect(x, top+spacing, w, height-(top+spacing));
  }

  void update() {

    x -=  5;
  }


  void hit(bird b) {

    if (b.y+b.yspeed < top || b.y+b.yspeed > top+spacing) {
      if (xb  > x-5 && xb < (x-5) + w) {
        b.alive = false;
        gen--;
      }
    }
  }
  void reset() {
    c = 255;
    top = random(height/2);  
    x = width-10;
  }
}

int closeted_pipe() {
int index = 0;
if(pipes[index].x+w <= xb) {
  index = 1;
  }
  
for(int i=index+1; i < counter ; i++) {
if(pipes[i].x+w <  pipes[index].x + w && pipes[i].x+w > xb) {
index = i;  
  
}
}


return index;
}
