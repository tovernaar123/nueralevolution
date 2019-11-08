void keyPressed() {
if( key == CODED) {
  
}else {
if( key == 'l') {
//TODO make a save file of bird.
for(int i=0; i < b.length; i++) {
if(b[i].alive) {
save = b[0].neural.stringefy();
saveStrings("data/neural.txt",save);  
break;  
  
}
  
  
}
  
}
  
}
  
  
}




 
