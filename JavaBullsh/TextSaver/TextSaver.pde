char letter;
String words = " ";
String poetry[] = new String[1];
int sentenceCounter = 0;

void setup() {
  size(640, 360);
  fill(0);
  
  //String[] dickLove = loadStrings("../poetry/text.txt");
  String[] dickLove = loadStrings("text.txt");
  sentenceCounter = dickLove.length;
  poetry = new String[sentenceCounter+1];
  for(int i = 0; i < sentenceCounter; i++)
  {
     poetry[i] = dickLove[i];
  }
}

void draw() {
  background(255); // Set background to black

  // Draw the letter to the center of the screen
  textSize(14);
  text("Click Here! And hit ENTER to Save", 50, 50);
  //text("Current key: " + letter, 50, 70);
  //text("The String is " + words.length() +  " characters long", 50, 90);
  
  text(words, 50, 120, 540, 300);
}

void keyTyped() {
  // The variable "key" always contains the value 
  // of the most recent key pressed.
  if ((key >= 'A' && key <= 'z') || key == ' ') {
    letter = key;
    words = words + str(key);
  } 
  
}

void keyReleased() {
  if (keyCode == ENTER || keyCode == RETURN)
  {
    poetry[sentenceCounter] = words;
    //saveStrings("../poetry/text.txt", poetry);
    saveStrings("text.txt", poetry);
    //String[] dickLove = loadStrings("../poetry/text.txt");
    String[] dickLove = loadStrings("text.txt");
    sentenceCounter = dickLove.length;
    poetry = new String[sentenceCounter+1];
    for(int i = 0; i < sentenceCounter; i++)
    {
       poetry[i] = dickLove[i];
    }
    words = " ";
    
  }
}

