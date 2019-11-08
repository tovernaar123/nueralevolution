void keyPressed() {
if( key == CODED) {
  
}else {
if( key == 'l'|| key == 'L') {
//TODO make a save file of bird.
//nextgen();
for(int i=0; i < b.length; i++) {
save = b[i].neural.stringefy();
saveStrings("data/neural"+i+".txt",save);  
 
  
}
for(int i=0; i < b.length; i++) {
if(b[i].alive) {
println(i);  
  
}
}
exit();
  
  
}
  
}
  
}
  
  





 
