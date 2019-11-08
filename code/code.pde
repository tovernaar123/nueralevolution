import java.io.*;
matrix m;
public String save[];
public int gen = 250;
bird b[] = new bird[gen];
int counter = 0;
pipe pipes[] = new pipe[4];
public float sum;
nn f1;
nn f2; 
int game_speed = 100;
int frame_game =  0;
double fit = 0;
void setup() {
  for (int i =0; i < b.length; i++) {
    b[i] = new bird();
  }
  b[0].neural = fromstring("neural.txt");
  fullScreen();
  background(0);
}


void draw() {
if( key != 's') {
game_speed = 100;  
}else {
game_speed =1;  
  
}
for(int amount_of_times =0;  amount_of_times < game_speed; amount_of_times++) {
  frame_game++;
  
  if (gen == 0) {
    sum = 0;
    for (int i =0; i < b.length; i++) {
    sum += b[i].score;  
      
    }
   for (int i =0; i < b.length; i++) {
      b[i].fitness = b[i].score/sum;
      //fit +=  b[i].score/sum ;
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
    
    fit = 0;
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

  for (int i =0; i < b.length; i++) {
     if (b[i].alive) {
      b[i].show(); 
     }
  }
  
  for (int i =0; i < counter; i++) {
  pipes[i].show();
  }
  
  
  
}

bird pick() {
int index = 0;  
float r1 = random(1);
//println(r1);

while(r1 > 0 && index != b.length) {

r1  =  r1 - b[index].fitness;
index++;

}
//println(index);
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
}else {
out = val;  
}
  
  
}
