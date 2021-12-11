import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.signals.*;
PImage back;
 
Minim minim;
AudioOutput out;

void setup()
{
  size(1000, 750, P3D);
  
   back = loadImage("piano.jpg");
 
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
}
 
void draw()
{
   background(back);
  stroke(255);
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
}
 
void keyPressed()
{
  SineWave mySine;
  MyNote newNote;

  float pitch = 0;
  switch(key) {
    case 'q': pitch = 260; break;
    case 'w': pitch = 270; break;
    case 'e': pitch = 290; break;
    case 'r': pitch = 310; break;
    case 't': pitch = 330; break;
    case 'y': pitch = 340; break;
    case 'u': pitch = 370; break;
    case 'i': pitch = 390; break;
    case 'o': pitch = 410; break;
    case 'p': pitch = 440; break;
    case 'a': pitch = 460; break;
    case 's': pitch = 490; break;
    case 'd': pitch = 520; break;
    case 'f': pitch = 550; break;
    case 'g': pitch = 580; break;
    case 'h': pitch = 620; break;
    case 'j': pitch = 650; break;
  }
  
   if (pitch > 0) {
      newNote = new MyNote(pitch, 0.2);
   }
}

void stop()
{
  out.close();
  minim.stop();
 
  super.stop();
}

class MyNote implements AudioSignal
{
     private float freq;
     private float level;
     private float alph;
     private SineWave sine;
     
     MyNote(float pitch, float amplitude)
     {
         freq = pitch;
         level = amplitude;
         sine = new SineWave(freq, level, out.sampleRate());
         alph = 0.9;
         out.addSignal(this);
     }

     void updateLevel()
     {
         level = level * alph;
         sine.setAmp(level);
         
         if (level < 0.01) {
             out.removeSignal(this);
         }
     }
     
     void generate(float [] samp)
     {
         sine.generate(samp);
         updateLevel();
     }
     
    void generate(float [] sampL, float [] sampR)
    {
        sine.generate(sampL, sampR);
        updateLevel();
    }

}
