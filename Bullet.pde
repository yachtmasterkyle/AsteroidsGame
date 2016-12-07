class Bullet extends Floater
{
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
  protected double dRadians;
  public Bullet()
  {
  	myCenterX = antidisestablishmentarianism.getX();
  	myCenterY = antidisestablishmentarianism.getY();
  	myPointDirection = antidisestablishmentarianism.getPointDirection();
  	dRadians = myPointDirection*(Math.PI/180);
  	myDirectionX = 3*Math.cos(dRadians) + antidisestablishmentarianism.getDirectionX();
  	myDirectionY = 3*Math.sin(dRadians) + antidisestablishmentarianism.getDirectionY();
  	myColor = color(255, 0, 0);
  }
  public void show()
  {
  	stroke(myColor);
  	fill(myColor);
  	ellipse((int)myCenterX, (int)myCenterY, 15, 15);
  }
  public void move()
  {
  	myCenterX += myDirectionX;
  	myCenterY += myDirectionY;
  }
}