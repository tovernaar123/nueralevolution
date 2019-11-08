import java.io.*;
public String save[];
public int gen = 250;
bird b[] = new bird[gen];
int counter = 0;
pipe pipes[] = new pipe[4];
public float sum;
int gena = 1;
int game_speed = 100;
int frame_game =  0;
double fit = 0;
void setup() {
  for (int i =0; i < b.length; i++) {
    b[i] = new bird();
    
    try { 
    File f = dataFile("neural"+i+".txt");
    boolean exist = f.isFile();
    if(exist) {
     b[i].neural = fromstring("neural"+i+".txt");  
      
    }
  } catch(Exception e){ 
    
  }
  }
  
  
  fullScreen(P2D);
  background(0);
}


void draw() {
if( key != 's') {
game_speed = 150;  
}else {
game_speed =1;  
  
}
for(int amount_of_times =0;  amount_of_times < game_speed; amount_of_times++) {
  frame_game++;
  
  if (gen == 0) {
    gena++;
    nextgen();  
   
  }
  
  
  
  
  
  
  if (frame_game % 100 == 0 || frame_game == 1 ) {

    if (counter < pipes.length) {
      pipes[counter] = new pipe();
      counter++;
    }
  }

  background(0);  

  for (int i =0; i < b.length; i++) {
    if (b[i].alive) {
      b[i].update(); 
      b[i].jump();
    }
  }





  for (int i =0; i < counter; i++) {

    pipes[i].update();
  
    if (pipes[i].x < 0 - w) {
      pipes[i].reset();
    }
    for (int j = 0; j < b.length; j++) {
      if (b[j].alive) {  
        pipes[i].hit(b[j]);
      }
    }
  }
 
}
  fill(255,0,0);
  textSize(100);
  text(gena,100,100);
  for (int i =0; i < b.length; i++) {
     if (b[i].alive) {
      b[i].show(); 
     }
  }
  
  for (int i =0; i < counter; i++) {
  pipes[i].show();
  }
  
  
  
}

public void nextgen() {
sum = 0;
    for (int i =0; i < b.length; i++) {
    sum += b[i].score;  
      
    }
   for (int i =0; i < b.length; i++) {
      b[i].fitness = b[i].score/sum;
      gen++;
    }
    for (int i =0; i < b.length; i++) {
     b[i] = pick();
    }
    
    for (int i =0; i < b.length; i++) {
    b[i].resetfit();   
    }
    
    counter = 0;
    frame_game = 1;
    
      
  
  
  
}
bird pick() {
int index = 0;  
float r1 = random(1);


while(r1 > 0 && index != b.length) {

r1  =  r1 - b[index].fitness;
index++;

}

index--;

bird child = new bird(b[index]);  
child.mutate(0.1);  
return child; 
}









public void sigmoid() {  //<>//
out = 1/(1+Math.exp(-val)); //<>//
} //<>//

public void doMutate() {
if(random(1) < rate) {
out = val + random(-0.2,0.2);  
//out = val + randomGaussian() * 0.1;
}else {
out = val;  
}
  
  
}
