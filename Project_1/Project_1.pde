//reference: code by Priyanshi sharma. https://github.com/OpenGenus/t-rex

Player b; 
PImage pl; 
PImage back; 

int score=0; 
int highScore=0; 
boolean safe=true; 
boolean start=false; 

PVector gravity = new PVector(0, 0.1); 
ArrayList<Barrier> barriers = new ArrayList<Barrier>(); 
int wid = 1100; 

void setup()
{
  size(1000,561, P2D); 
  b = new Player(); 
  pl = loadImage("Luffy.PNG"); 
  back = loadImage("OPBG.png");
}

void draw()
{
   background(back);
   
  if(start) 
    {
      
      if(random(1)<0.5&&frameCount % 60 == 0)
        {
          barriers.add(new Barrier()); 
        }
    }
    
   if(keyPressed)
    {
      start = true; 
      if(b.pos.y == height-170) 
        {
          PVector up = new PVector(0,-100); 
          b.applyForce(up); 
        }
    }
  
   b.update(); 
   b.show(); 

        for(int i=barriers.size()-1; i>=0; i--)
    {
        Barrier p = barriers.get(i);
        p.update();
        
        if (p.hits(b))
          {
            p.show(true);
            safe=false;
          }
        else
          {
            p.show(false);
            safe=true;
          }
               
        if(p.x < -p.w)
          {
            barriers.remove(i);
          }
    }
  
  if(safe&&start) 
    {
      score++;
    }
  else
    {      
      score=0;
      text("PRESS SPACE TO START",width/2-500,50);
      start=false; 
    }
    
    fill(16,53,201); 
    textSize(32); 
        
    text("Score",width/2-100,50);
    text(score,width/2,50);
       
    if(highScore < score)
    {
      highScore = score;
    }
    
    text(highScore,width/2+310,50);
    text("High Score",width/2+300-170,50);  
}
