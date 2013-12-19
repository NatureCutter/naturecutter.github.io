 rain[] regen;
PImage img;
int tropfen = 4000;

void setup() {
 size(628, 400);
 
 regen = new rain[tropfen];                //initialize all Drops
 for(int i = 0; i < tropfen; i++) 
 {
  regen[i] = new rain();
 }  


}

void draw() {
 background(255);

 for(int i = 0; i < tropfen; i++)         //update and draw all Drops
 {
  regen[i].update();
  regen[i].display();
 }
 
  fill(255);
 noStroke();
 //ellipse(mouseX, mouseY, 40, 40);


}

class rain 
{

  PVector first, second, velocity, start;
 int laenge;
 int versatz;            //Damit nicht alle Tropfen oben "kleben"
 float lu, la, angle, fact;
   rain() 
   {
    start = new PVector((int)random(1000), (int)random(400));
    angle = random(0.1, 0.7);
    laenge = (int)random(2, 12);
    first = new PVector(start.x, start.y);
    lu = sin(-angle) * laenge;
    la = cos(-angle) * laenge;
    second = new PVector(first.x + lu, first.y + la);
    fact = random(1.7,3);
    velocity = new PVector(lu , la );
   }
   
   void update() 
   {
    if(second.x < 0)               //check if the drop is too far left
    {
     first.x = 1000; //random(1000);
     versatz = (int)random(-20);
     //first.y = 0 + versatz;
     second.x = first.x + lu;
     //second.y = first.y + la;
    }  
    
    if(second.y > 400)              //check if drop is too far below
    {
     first.x = random(1020);
     versatz = (int)random(-20);
     first.y = 0 + versatz;
     second.x = first.x + lu;
     second.y = first.y + la;
    }
    
    PVector maus  = new PVector(mouseX, mouseY);          //Maus
    if (second.dist(maus) < 70)
    {
      PVector hilf = new PVector(0, 1);
      float beta = PVector.angleBetween(velocity, hilf);
      float mausDistance = second.dist(maus);
      float mVX = mausDistance * cos(beta);          //mouseVelocityX
      float mVY = mausDistance * sin(beta);          //mouseVelocity Y
      PVector mausVelocity = new PVector(mVX, mVY);
      velocity.mult(mausVelocity);
      //velocity.normalize();
      //velocity.mult(fact);
    }
   
     else
    {
     velocity = new PVector(lu * fact, la * fact);        
    } 
    
   }
 
   void display()
   {
    stroke(0);
    line(first.x, first.y, second.x, second.y);
    first.add(velocity);
    second.add(velocity);
   }
   
   void attraktor() 
   {
    if(mousePressed)
     {
      
     } 
   }
}
