import de.bezier.guido.*;
//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
private final static int NUM_ROWS = 5;
private final static int NUM_COLS = 5;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> mines = new ArrayList<MSButton>(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
  size(400, 400);
  textAlign(CENTER, CENTER);
  // make the manager
  Interactive.make( this );
  buttons = new MSButton[NUM_ROWS][NUM_COLS];
  for (int r = 0; r<NUM_ROWS; r++) {
    for (int c= 0; c<NUM_COLS; c++) {
      buttons[r][c] = new MSButton(r, c);
    }
    for(int i = 0; i < 5; i++)
        setMines();
  }


  setMines();
}
public void setMines()
{
  mines = new ArrayList<MSButton>();
  int row = (int)(Math.random()*NUM_ROWS-1);
  int col = (int)(Math.random()*NUM_COLS-1);
  if (!mines.contains(buttons[row][col])) {
    mines.add(buttons[row][col]);
  }
}

public void draw ()
{
  background( 0 );
  if (isWon() == true)
    displayWinningMessage();
    noLoop();
}
public boolean isWon()
{
   for(int i = 0; i < mines.size(); i++)
        if(!mines.get(i).isMarked())
            return false;
    for(int r = 0; r < NUM_ROWS; r++)
        for(int c = 0; c < NUM_COLS; c++)
            if(!bombs.contains(buttons[r][c]))
                if(!buttons[r][c].isClicked())
          
  return false;
}
public void displayLosingMessage()
{
   for(int i = 0; i < mines.size(); i++)
        mines.get(i).mousePressed();
    fill(255);
    for(int r = 0; r < NUM_ROWS; r++)
        for(int c = 0; c < NUM_COLS; c++)
        {
            buttons[r][c].setLabel("");
            buttons[r][c].setColr(0, 0, 0);
        }
    buttons[4][1].setLabel("Y");
    buttons[4][2].setLabel("O");
    buttons[4][3].setLabel("U");
    buttons[4][5].setLabel("L");
    buttons[4][6].setLabel("O");
    buttons[4][7].setLabel("S");
    buttons[4][8].setLabel("E");
}
public void displayWinningMessage()
{
  for(int r = 0; r < NUM_ROWS; r++)
        for(int c = 0; c < NUM_COLS; c++)
        {
            buttons[r][c].setLabel("");
            buttons[r][c].setColr(#7675EF);
        }
    buttons[4][1].setLabel("Y");
    buttons[4][2].setLabel("O");
    buttons[4][3].setLabel("U");
    buttons[4][4].setLabel(" ");
    buttons[4][5].setLabel("W");
    buttons[4][6].setLabel("O");
    buttons[4][7].setLabel("N");
    buttons[4][8].setLabel("!");
}
public boolean isValid(int r, int c)
{
  if (r >= 0 && c >= 0 && r < NUM_ROWS && c < NUM_COLS)
    return true;
  return false;
}
public int countMines(int row, int col)
{
  int numMines = 0;
  for (int r = row-1; r<= row+1; r++)
    for (int c = col-1; c <= col+1; c++)
      if (isValid(r, c) && mines.contains(buttons[row][col])) {
        numMines++;
      }
  return numMines;
}
public class MSButton
{
  private int myRow, myCol;
  private float x, y, width, height;
  private boolean clicked, flagged;
  private String myLabel;

  public MSButton (int row, int col)
  {
    width = 400/NUM_COLS;
    height = 400/NUM_ROWS;
    myRow = row;
    myCol = col;
    x = myCol*width;
    y = myRow*height;
    myLabel = "";
    flagged = clicked = false;
    Interactive.add( this ); // register it with the manager
  }

  // called by manager
  public void mousePressed ()
  {
    clicked = true;
    if (mouseButton == RIGHT)
      if (flagged == false)
      {
        flagged = true;
      }
      else
      {
        clicked = false;
        flagged = false;
      }
      else if (mines.contains(this)
        setLabel("" + countMines(row, col));
  }
    public void draw ()
    {    
      if (flagged)
      fill(0);
      else if (clicked && mines.contains(this))
      fill(255, 0, 0);
      else if (clicked)
      fill(200);
      else
      fill(100);
      rect(x, y, width, height);
      fill(0);
      text(myLabel, x+width/2, y+height/2);
    }
    public void setLabel(String newLabel)
    {
      myLabel = newLabel;
    }
    public void setLabel(int newLabel)
    {
      myLabel = ""+ newLabel;
    }
    public boolean isFlagged()
    {
      return flagged;
    }
  }


