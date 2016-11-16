SpaceShip antidisestablishmentarianism = new SpaceShip(); //your variable declarations here
Star [] space;
Asteroid [] roids;
int numStars = 50;
int numAsteroids = 25;
public void setup() 
{
  size(600, 600);
  background(0);//your code here
  roids = new Asteroid[numAsteroids];
  space = new Star[numStars];
  for(int i=0; i < numStars; i++)
  {
    space[i] = new Star();
  }
  for(int i = 0; i < numAsteroids; i++)
  {
    roids[i] = new Asteroid();
  }
}
public void draw() 
{
  background(0);//your code here
  antidisestablishmentarianism.show();
  antidisestablishmentarianism.move();
  for(int i=0; i < numStars; i++)
  {
    space[i].show();
  }
  for(int i = 0; i < numAsteroids; i++)
  {
    roids[i].move();
    roids[i].show();
  }
}
class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
    corners = 4;  //the number of corners, a triangular floater has 3   
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;   
    yCorners[0] = -8;   
    xCorners[1] = -4;   
    yCorners[1] = 0;   
    xCorners[2] = -8;   
    yCorners[2] = 8;
    xCorners[3] = 16;     
    yCorners[3] = 0;
    myColor = (255);
   // myColor = (223,217,217);
    myCenterX = 300;
    myCenterY = 300;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}   
    public double getPointDirection(){return myPointDirection;} 
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 
  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }    
}
public void keyPressed()
{
  if(keyCode == 83)
  {
    antidisestablishmentarianism.accelerate(-.1);
  }
  if(keyCode == 87)
  {
    antidisestablishmentarianism.accelerate(.1);
  }
  if(keyCode == 65)
  {
    antidisestablishmentarianism.rotate(-10);
  }
  if(keyCode == 68)
  {
    antidisestablishmentarianism.rotate(10);
  }
  if(keyCode == 32)
  {
    antidisestablishmentarianism.setX((int)(Math.random() * 300));
    antidisestablishmentarianism.setY((int)(Math.random() * 300));
    antidisestablishmentarianism.setDirectionX(0);
    antidisestablishmentarianism.setDirectionY(0);
    antidisestablishmentarianism.setPointDirection((int)(Math.random() * 360));
  }
}
  class Star
  {
    protected int myX, myY;
    public void setX(int x) {myX = x;}
    public int get (){return myX;}
    public void setY(int y){myY = y;}
    public int getY(){return myY;}
    public Star()
    {
      myX = (int)(Math.random()*600);
      myY = (int)(Math.random()*600);
    }
    public void show()
    {
      fill(255);
      ellipse(myX, myY, 2, 2);
    }
  }
  class Asteroid extends Floater
  {
    private int rotateSpeed;
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}   
    public void setPointDirection(int degrees){myPointDirection = degrees;}   
    public double getPointDirection(){return myPointDirection;} 
    public Asteroid()
    {
      rotateSpeed = (int)(Math.random() * 8 - 4);
      corners = 16;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = 4;
      yCorners[0] = 3;
      xCorners[1] = 4;
      yCorners[1] = 5;
      xCorners[2] = 7;
      yCorners[2] = 5;
      xCorners[3] = 7;
      yCorners[3] = 3;
      xCorners[4] = 11;
      yCorners[4] = 3;
      xCorners[5] = 11;
      yCorners[5] = 1;
      xCorners[6] = 6;
      yCorners[6] = -1;
      xCorners[7] = 3;
      yCorners[7] = -4;
      xCorners[8] = -5;
      yCorners[8] = -4;
      xCorners[9] = -6;
      yCorners[9] = -1;
      xCorners[10] = -10;
      yCorners[10] = 1;
      xCorners[11] = -10;
      yCorners[11] = 3;
      xCorners[12] = -7;
      yCorners[12] = 3;
      xCorners[13] = -7;
      yCorners[13] = 5;
      xCorners[14] = -4;
      yCorners[14] = 5;
      xCorners[15] = -4;
      yCorners[15] = 3;
      myColor = (255);
      myCenterX = (int)(Math.random()*600);
      myCenterY = (int)(Math.random()*600);
      myDirectionX = Math.random()*2-1;
      myDirectionY = Math.random()*2-1;
      myPointDirection = (int)(Math.random()*Math.PI/180);
    }
    public void show()
    { 
      stroke(255);     
      double dRadians = myPointDirection*(Math.PI/180);                 
      int xRotate, yRotate;    
      beginShape();         
      for(int nI = 0; nI < corners; nI++)    
      {     
        xRotate = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
        yRotate = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
        vertex(xRotate, yRotate);    
      }   
      endShape(CLOSE);  
    }
    public void move()
    {
      rotate(rotateSpeed);
      super.move();
    }
  }