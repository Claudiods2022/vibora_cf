//variables espaciales del juego

int w=50, m=0, b=0; // la medición del ancho 
int h=30, p=0; // la medición del alto
int div=20; //cuán grande es la división de cada cuadrado de la cuadricula
int largo=0;


//poscicion de la cabeza de vibora
int x=17; //posición de la serpiente en x en un inicio
int  y=14; //posición de la serpiente en y en un inicio
//variables del usuario;



//variables de direccion del largo de la vibora
int sx=0;
int sy=0;
int crecimiento=0,cx,cy;  //variables relacionadas al crecimiento de la serpiente
short direccion=0;
int punto=0;

//poscicion de manzana
int xr;
int yr;





void setup() {
  size  (700, 600); //tamaño de la ventana
  frameRate(13);
   xr=(int)(random(-15, 15));
   yr=(int)(random(-13, 13));
     
}

   
 

void draw() {
  background (5, 5, 5);
  for (int l=0; l<w; l++) line (l*div, 0, l*div, height); //cuadricula, parte vertical
  for (int l=0; l<h; l++) line (0, l*div, width, l*div); //cuadricula, parte horizontal
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
      sy=1;
      sx=0;
      break;
    
    case 2:
       p--;
       sy=-1;
       sx=0;
       break;
    
    case 3:
      m--;
      sx=-1;
      sy=0;
      break;
    
    case 4:
       m++;
       sx=1;
       sy=0;
       break;
  }
}

void comer(){
   if (((x*div+p*div)==(x+xr)*div)&&((y*div+m*div)==(y+yr)*div)) 
   { 
     
     
     crecimiento++;
   
    xr=(int)(random(-15, 15)); //int random = (int) (0......)   sentencia para numero aleatorio y que sea entero
    yr=(int)(random(-13, 13));
    punto=punto+10;
  }
}

void serpiente(){
    fill(40, 116, 166);  
    rect(x*div+p*div, y*div+m*div, div, div); 
    fill(0, 255, 0);  
    if(crecimiento!=0)
    {  
      for(int c=1;c<=crecimiento;c++)
      {
         fill(40, 116, 166);  
    rect(x*div+p*div, y*div+m*div, div, div); 
    
        cx=(x-(sy*crecimiento))*div+p*div;
        cy=(y-(sx*crecimiento))*div+m*div;
         
        
       rect(cx,cy, div, div); 
      }
    }
}

void manzana() { 
    fill(255, 0, 0); 
    rect((x+xr)*div, (y+yr)*div, div, div);
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
  text ("("+cx+","+cy+")", 120,height-10);
  
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
