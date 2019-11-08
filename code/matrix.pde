public double val; //<>//
public double out;
class matrix  {

  double [][] matrix;
  int rows;
  int cols;
  matrix(int row, int col) {
    rows = row; 
    cols = col;
    matrix = new double[rows][cols];
  }
  matrix(double[] x) {
    matrix = new double[x.length][1];
    for (int i=0; i < x.length; i++) {
      matrix[i][0] = x[i];
    }
  }

  double[][] mcopy() {
    double[][] result = new double[matrix.length][ matrix[0].length];
    for (int x =0; x < matrix.length; x++) {
      for (int y =0; y < matrix[0].length; y++) {
        result[x][y] = matrix[x][y];
      }
    }
    return result;
  }

  void random2d(float min, float max) {
    for (int x =0; x < matrix.length; x++) {
      for (int y =0; y < matrix[0].length; y++) {
        matrix[x][y] = random(min, max);
      }
    }
  }

  void printm() {
    double row[] = new double[matrix.length];
    for (int y =0; y < matrix.length; y++) {
      row = matrix[y];
      for (int i=0; i< row.length; i++) {
        print(row[i]+" ");
      }
      println("");
    }
    println("");
  }

  void Sub(double[][] min) {
    for (int x =0; x < matrix.length; x++) {
      for (int y =0; y < matrix[0].length; y++) {
        matrix[x][y] -= min[x][y];
      }
    }
  }

  void Mult(double[][] min) {
    for (int x =0; x < matrix.length; x++) {
      for (int y =0; y < matrix[0].length; y++) {
        matrix[x][y] *= min[x][y];
      }
    }
  }

  void Sub(double num) {
    for (int x =0; x < matrix.length; x++) {
      for (int y =0; y < matrix[0].length; y++) {
        matrix[x][y] -= num;
      }
    }
  }

  void Mult(double num) {
    for (int x =0; x < matrix.length; x++) {
      for (int y =0; y < matrix[0].length; y++) {
        matrix[x][y] *= num;
      }
    }
  }

  void Add(matrix min) {
    for (int x =0; x < matrix.length; x++) {
      for (int y =0; y < matrix[0].length; y++) {
        matrix[x][y] += min.matrix[x][y];
      }
    }
  }

  void Add(double num ) {
    for (int x =0; x < matrix.length; x++) {
      for (int y =0; y < matrix[0].length; y++) {
        matrix[x][y] += num;
      }
    }
  }

  double[][]  shift() {
    double[][] result = new double[cols][rows];
    for (int x =0; x < matrix.length; x++) {
      for (int y =0; y < matrix[0].length; y++) {
        result[y][x] = matrix[x][y]; 
        ;
      }
    }  
    return result;
  }

  void Map( String func) {
    for (int x =0; x < matrix.length; x++) {
      for (int y =0; y < matrix[0].length; y++) {
        val =  matrix[x][y]; 
        method(func);
        matrix[x][y] = out;
      }
    }
  }
  String[] stringefy() {
    String[] result = new String[matrix.length*matrix[0].length];
    int counter = 0;
    for (int x =0; x < matrix.length; x++) {
      for (int y =0; y < matrix[0].length; y++) {
        String now = "";
        if(x == matrix.length-1 && y  == matrix[0].length-1) {
         int xr =x+1;
         int yr = y+1;
        now = xr+" "+yr+": ";
        }
        now +=  matrix[x][y];
        result[counter] = now;
        counter++;
      }
    }
    return result;
  }
}



public double[][] multp(matrix a, matrix b) {
  if (a.matrix[0].length != b.matrix.length) {
    println("error");
    return null;
  } else {
    double[][] matrixc = new double[0][0];   
    double[][] minc = new double[0][0]; 
    matrixc = a.mcopy();
    minc = b.mcopy();
    double[][] result = new double[a.matrix.length][b.matrix[0].length];   
    for (int i =0; i < result.length; i++) {
      for (int j =0; j <result[0].length; j++) {
        double sum = 0;
        for (int k = 0; k < b.matrix.length; k++) {
          sum += matrixc[i][k] * minc[k][j];
        }
        result[i][j] = sum;
      }
    } 
    return result;
  }
}

double[] mTo_a(matrix f) {
  double[] result = new double[f.matrix.length];
  for (int x =0; x < f.matrix.length; x++) {

    result[x] = f.matrix[x][0];
  }
  return result;
}  

matrix toMatrix(String data[]) {
  char len[] = data[data.length-1].toCharArray();
  int rows    = 0;
  int colums  = 0;
  int counter = 0;
  String rowS = "";
  String columS = "";
  String nw  = "";
  //double now = 0;
  for (int i= 0; i < len.length; i++, counter++) {
    if (len[i] != ' ') {
      rowS += len[i];
    } else {
      
      
      rows = int(rowS);
      counter++;
      break;
    }
  }
  
  for (int i= 0; i < len.length; i++, counter++) {
    if (len[i] != ' ' && len[i] != ':') {
      columS += len[counter];
    } else {
      for(int f = counter+2; f < len.length; f++) {
      nw += len[f]; 
      }
      data[data.length-1] = nw;
     
      colums = int(columS);  
      counter =0;
      break;
    }
  }
  

  
  matrix result = new matrix(rows, colums); 
  for (int x =0; x < result.matrix.length; x++) {
      for (int y = 0; y < result.matrix[0].length; y++, counter++) {
        result.matrix[x][y] = Double.parseDouble(data[counter]);
  
      }
    }
  
  return result;
}
