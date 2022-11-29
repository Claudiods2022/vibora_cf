ArrayList<Integer> x=new ArrayList<Integer>(), y= new ArrayList<Integer>();

int w=50, m=0, b=0; // la medición del ancho 
int h=30, p=0; // la medición del alto
int div=20; //cuán grande es la división de cada cuadrado de la cuadricula
int punto=0;
short direccion=0;
int xr;
int yr;
int i;

int largo=1;

void setup() {
  size  (700, 600); //tamaño de la ventana
  x.add(17); //posición de la serpiente en x en un inicio
  y.add(14); //posición de la serpiente en y en un inicio
  frameRate(13);
   xr=(int)(random(-15, 15));
   yr=(int)(random(-13, 13));
}

void draw() {
  background (5, 5, 5);
  for (int i=0; i<w; i++) line (i*div, 0, i*div, height); //cuadricula, parte vertical
  for (int i=0; i<h; i++) line (0, i*div, width, i*div); //cuadricula, parte horizontal
  stroke (100, 100, 80);
  limites();
  pantalla(); 
  manzana();
  puntaje ();
  tp();
  serpiente();
  comer();
   switch(direccion){
    case 1:
      p++;
      break;
    
    case 2:
       p--;
       break;
    
    case 3:
      m--;
      break;
    
    case 4:
       m++;
       break;
  }
}

void comer(){
   if (((x.get(i)*div+p*div)==(x.get(i)+xr)*div)&&((y.get(i)*div+m*div)==(y.get(i)+yr)*div)) { //comparación
    xr=(int)(random(-15, 15)); //int random = (int) (0......)   sentencia para numero aleatorio y que sea entero
    yr=(int)(random(-13, 13));
    largo++;
    punto=punto+10;
  }
}

void serpiente(){
    fill(40, 116, 166); 
    rect(x.get(i)*div+p*div, y.get(i)*div+m*div, div*largo, div); 
}

void manzana() { 
    fill(255, 0, 0); 
    rect((x.get(i)+xr)*div, (y.get(i)+yr)*div, div, div);
}

void pantalla() {
  if (millis()<3000) {
    fill(40, 116, 166);
    textSize(100);
    text("SNAKE", 190, 140); //parte de la pantalla de inicio que no esta terminada
  }
}

void puntaje() {
  
  fill(40, 116, 166);
  textSize (30);
  text("Score:"+punto, 0, 30);
}
  
void tp(){  
  text ("("+p+","+m+")", 0,height-10);
  
  if(p>=16)
  {
    p=-16;
  }else if(p<=-16)
  {
    p=16;
  }else if(m>=13)
  {
    m=-13;
  }else if(m<=-13)
  {
    m=13;
  }
} 

void limites() {
    fill(0);
    strokeWeight(1);
    rect(0, 0, div*2, 800);
    rect(660, 0, div*2, 800);
    rect(0, 560, 700, div*2);
    rect(0, 0, 700, div*2);
}

void keyPressed () {
  
  if (key== 'd'|| key == 'D') { 
    //p++;
    direccion=1;
  } 
  else if (key== 'a'|| key == 'A') {
    //p--;
    direccion=2;
  }
  else if (key== 'w'|| key == 'W') {
    //m--;
    direccion=3;
  }
  else if (key== 's'|| key == 'S') {
  //  m++;
    direccion=4;
  }
}
