/* 
    @pjs font="0.ttf, 1.ttf, 2.ttf, 3.ttf, 
               4.ttf, 5.ttf, 6.ttf, 7.ttf, 
               8.ttf"; 
*/

int fontNumber = 9;
PFont fonts[];
int timer;
int timer2;
String[] sentences;

void setup() {

  size(666, 666);
  background(255);

  fonts = new PFont[fontNumber];

  for (int i = 0; i < fontNumber; i++)
  {
    fonts[i] = createFont(i + ".ttf", 66);
  }
  
  //sentences = loadStrings("/../../poetry/text.txt");
  sentences = loadStrings("text.txt");

  fill(0);
}

void draw() {
  
  //rect( 0,0,40,40);
  
  if (millis() - timer >= 1000)
  {
    int[] which = new int[3];
    for(int i = 0 ; i < 3; i++)
    {
      which[i] = int(random(sentences.length));
    }

    background(255);
    int number = int(random(fontNumber));
    //println(number);
    textFont(fonts[number]); 
    text(sentences[which[0]] + "\n" +
         sentences[which[1]] + "\n" + 
         sentences[which[2]], 66, 66, width-width/3, height-66);
    timer = millis();
  }
  if (millis() - timer2 >= 10000)
  {
    println("updated new text");
    //sentences = loadStrings("../../poetry/text.txt");
    sentences = loadStrings("text.txt");
    //println(sentences.length);
    timer2 = millis();
  }
  
}

