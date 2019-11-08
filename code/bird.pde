float gravity = 1;
float lift = - 20;
public float xb = 255;
class bird {
  nn neural = new nn(5,9,2);
  float y = height/2;
  float yspeed = 0;
  boolean alive = true;
  int score = 1;
  float fitness = 0;
  void show() {
    ellipseMode(RADIUS);
    fill(255, 255, 255, 150);
    ellipse(xb, y, 20, 20);
  }

bird() {
y = height/2;  
yspeed = 0;  
alive = true;
score = 0;
fitness = 0;
}
bird(bird b) {
neural = b.neural.Copy();
score = b.score;
fitness = b.fitness;
y = height/2;  
yspeed = 0;  
alive = true;
}

void resetfit() {
score   =0;
fitness =0;
  
  
}



  void update() {
    score += 1;
    yspeed += gravity; 
    yspeed *= 0.9;                                       
    y += yspeed;

    if (y > height) {
     alive = false;
     gen--;
    }

    if ( y < 0) {
     alive = false;
     gen--;
    }
  }
  void jump() {
    
  double[] input = {
  y/height,
  pipes[closeted_pipe()].top/height,
  (pipes[closeted_pipe()].top + pipes[closeted_pipe()].spacing)/height,
  pipes[closeted_pipe()].x/width,
  yspeed/10,
  };
  
  
  double[] output = neural.feedforward(input);
   
   if(output[0] > output[1]) {
    yspeed += lift;
    score -= 1;
   }
   
  }  

void mutate(float chance) {
neural.mutate(chance);  
  
  
}


  
}
