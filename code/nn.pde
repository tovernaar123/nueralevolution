public double rate = 0;



class nn  {
int inputs_nodes;
int hidden_nodes;
int outputs_nodes;
matrix weights_ih, weights_ho, bais_h, bais_o ;
matrix hidden, input, output;

nn(int in,int hiddenr,int out) {
inputs_nodes = in;  
hidden_nodes = hiddenr;  
outputs_nodes = out;

weights_ih = new matrix(hidden_nodes,inputs_nodes);
weights_ho = new matrix(outputs_nodes,hidden_nodes);
bais_h = new matrix(hidden_nodes,1);
bais_o = new matrix(outputs_nodes,1);
weights_ih.random2d(-1,1);
weights_ho.random2d(-1,1);
bais_h.random2d(-1,1);
bais_o.random2d(-1,1);
}


nn(nn b) {
  
inputs_nodes = b.inputs_nodes;  
hidden_nodes = b.hidden_nodes;  
outputs_nodes = b.outputs_nodes;

weights_ih = new matrix(hidden_nodes,inputs_nodes);
weights_ho = new matrix(outputs_nodes,hidden_nodes);
bais_h = new matrix(hidden_nodes,1);
bais_o = new matrix(outputs_nodes,1);

weights_ih.matrix = b.weights_ih.mcopy();
weights_ho.matrix = b.weights_ho.mcopy();
bais_h.matrix = b.bais_h.mcopy();
bais_o.matrix = bais_o.mcopy();

}


double[] feedforward(double inputu[]) {
  double[] geus = new double[0];
  input = new matrix(inputu);
  hidden = new matrix(0,0);
  output = new matrix(0,0);
  
  hidden.matrix = multp(weights_ih,input);
  hidden.Add(bais_h);
  hidden.Map("sigmoid");
  
  output.matrix = multp(weights_ho,hidden);
  output.Add(bais_o);
  output.Map("sigmoid");
  
  geus = mTo_a(output);
  return geus;
}



nn Copy() {
return new nn(this);  
}

void mutate(double chance) {
rate  = chance;
weights_ih.Map("doMutate"); 
weights_ho.Map("doMutate"); 
bais_h.Map("doMutate"); 
bais_o.Map("doMutate"); 

}

String[] stringefy() {
String ih[];
String ho[];
String bh[];
String bo[];
int counter = 0;
ih = weights_ih.stringefy();
ho = weights_ho.stringefy();
bh = bais_h.stringefy();
bo = bais_o.stringefy();
String result[] = new String[ih.length + ho.length + bh.length + bo.length+4]; 

for(int i =0; i < ih.length; i++, counter++ ) {
result[i] = ih[i];  
  
}

result[counter] = "new";
counter++;
for(int i =0; i < ho.length; i++, counter++ ) {
result[counter] = ho[i];  
  
}

result[counter] = "new";
counter++;
for(int i =0; i < bh.length; i++, counter++ ) {
result[counter] = bh[i];  
  
}

result[counter] = "new";
counter++;

for(int i =0; i < bo.length; i++, counter++ ) {
result[counter] = bo[i];  
  
}
result[counter] = "new";
counter++;


return result;  
  
}


  
}

nn fromstring(String x) {
String data[];
data = loadStrings(x);
String ih[] = new String[0];
String ho[] = new String[0];;
String bh[] = new String[0];;
String bo[] = new String[0];;
int counter = 0;
//printArray(data);
for(int i=0; i < data.length; i++, counter++ ) {  

if(!data[counter].equals("new")) {

ih = append(ih,data[counter]);  
}else {
counter++;
break; 
}
  
}
for(int i=0; i< data.length; i++, counter++ ) {  
if(!data[counter].equals("new")) {
ho = append(ho,data[counter]);  
}else {
counter++;
break; 
}
  
}
for(int i=0; i< data.length; i++, counter++ ) { 
if(!data[counter].equals("new")) {
   bh = append(bh,data[counter]);  
}else {
counter++;
break; 
}
  
}
for(int i=0; i< data.length; i++, counter++ ) {
if(!data[counter].equals("new")) {
bo = append(bo,data[counter]);  
}else {
counter++;
break; 
}
  
}
matrix ihr = toMatrix(ih);
matrix hor = toMatrix(ho);
matrix bhr = toMatrix(bh);
matrix bor = toMatrix(bo);
//weights_ih = new matrix(hidden_nodes,inputs_nodes);
//weights_ho = new matrix(outputs_nodes,hidden_nodes);
//bais_h = new matrix(hidden_nodes,1);
//bais_o
int h = ihr.matrix.length+1;
int i = ihr.matrix[0].length+1;
int o = hor.matrix.length+1;
println(i);
println(h);
println(o);
nn result = new nn(i,h,o);
println(ihr.matrix[0].length);
result.weights_ih = ihr;
result.weights_ho = hor;
result.bais_h     = bhr;
result.bais_o     = bor;
return result;  
  
}
