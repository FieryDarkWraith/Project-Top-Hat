import java.util.*;

PImage board,token1,token2,token3,token4;
//pre-Board settings
private final static String [] Tokens= {"barrow","boot","car","dog","hat","iron","ship","thimple"};
public static  ArrayList<String> AvailableTokens = new ArrayList<String>(Arrays.asList(Tokens));
private static int numPlayer;
public static String [] TokenList;

//Game variables
private static Slot[] SlotsList = new Slot[40];
private static Player[] PlayerList;
private static ArrayList<PImage> PlayerTokens;
private static final int[][] locations = { {750,750} , {660,750} , {595,750}, {530,750}, {465,750}, {400,750}, {335,750}, {270,750}, {205,750}, {140,750}, 
                                           {50,750}, {50,660}, {50,595}, {50,530}, {50,465}, {50,400}, {50,335}, {50,270}, {50,205}, {50,140},
                                           {50,50}, {140,50}, {205,50}, {270,50}, {335,50}, {400,50}, {465,50}, {530,50}, {595,50}, {660,50},
                                           {750,50}, {750,140}, {750,205}, {750,270}, {750,335}, {750,400}, {750,465}, {750,530}, {750,595}, {750,660} };

void setup(){
  size(800,800);  
  board = loadImage("./images/monopolyBoard.jpg");
  board.resize(800,800);
  background(board);

  PlayerSet playercalc = new PlayerSet();
  numPlayer = playercalc.NumPlayer;
  TokenList = new String[numPlayer];  
  //print(numPlayer);
  PlayerList = new Player[numPlayer];
  
  for(int i = 0; i < PlayerList.length ; i++){
    TokenSet x = new TokenSet(i+1);
    //print(TokenList[i]);
    while(x.waitnext){
      try{
        Thread.sleep(1000);
      } catch(InterruptedException ex){
        Thread.currentThread().interrupt();
      }
    }
    PlayerList[i] = new Player(TokenList[i]);
  }
  
  
  //Setup tokens for the players;
  PlayerTokens = new ArrayList<PImage>();//store the actual images themselves. Players have the string.
  if(numPlayer>=2){
      token1 = loadImage("./images/tokens/monopoly_token_"+PlayerList[0].getToken()+".png");
      token2 = loadImage("./images/tokens/monopoly_token_"+PlayerList[1].getToken()+".png");
      PlayerTokens.add(token1);
      PlayerTokens.add(token2);
  }
  if(numPlayer>=3){
      token3 = loadImage("./images/tokens/monopoly_token_"+PlayerList[2].getToken()+".png");
      PlayerTokens.add(token3);
  }
  if(numPlayer>=4){
      token4 = loadImage("./images/tokens/monopoly_token_"+PlayerList[3].getToken()+".png");
      PlayerTokens.add(token4);
  }
  for(int i=0; i<PlayerTokens.size();i++){
      PlayerTokens.get(i).resize(40,40); 
  }
  
  //Construct the Slot array, your job kevin, GO is 0 on the slot array 
}

//conversion for location IDs to x-cor and y-cor with respect to the display
int convertLocationToXCor(int locat){
   return locations[locat][0];
}
int convertLocationToYCor(int locat){
   return locations[locat][1]; 
}
  
  
void draw(){
    background(board);
    for(int i =0;i < numPlayer; i++){
       int locat = PlayerList[i].getLocation();
       PImage disp = PlayerTokens.get(i);
       imageMode(CENTER);
       image(disp, convertLocationToXCor(locat), convertLocationToYCor(locat));
    }
       
}

void SetProperty(){
  SlotsList[0] = new Slot(0);
  
  int [] MeditH = {2,10,30,90,60,250};  
  SlotsList[1] = new Property(1,"Mediterranean Ave",60,2,50,50,30,"brown",MeditH);
  
  SlotsList[2] = new Community(2);
  
  int [] BaltiH = {4,20,60,180,320,450};
  SlotsList[3] = new Property(3,"Baltic Ave",60,4,50,50,30,"brown",BaltiH);
  
  SlotsList[4] = new Tax(4);
  
  SlotsList[5] = new Railroad(5,"Reading Railroad");
  
  int [] OrientH = {6,30,90,270,400,550};
  SlotsList[6] = new Property(6,"Oriental Ave",100,6,50,50,50,"light blue",OrientH);
  
  SlotsList[7] = new Chance(7);
  
  int [] VermH = {6,30,90,270,400,500};
  SlotsList[8] = new Property(8,"Vermont Avenue",100,6,50,50,50,"light blue",VermH);
  
  int [] ConnH = {8,40,100,300,450,600};
  SlotsList[9] = new Property(9,"Connecticut Avenue",120,8,50,50,60,"light blue",ConnH);
  
  SlotsList[10] = new Slot(10);
  
  int [] StcH = {10,50,150,450,625,750};
  SlotsList[11] = new Property(11,"St. Charles Place",140,10,100,100,70,"pink",StcH);
  
  SlotsList[12] = new Utility(12);
  
  int[] StAve = {10,50,150,450,625,750};
  SlotsList[13] = new Property(13,"States Avenue",140,10,100,100,70,"pink",StAve);
  
  int[]VAAve = {12,60,180,500,700,900};
  SlotsList[14] = new Property(14,"Virgina Avenue",160,12,100,100,80,"pink",VAAve);
  
  SlotsList[15] = new Railroad(15,"Pennsylvania Railroad");
  
  int[]SJP = {14,70,200,550,750,950};
  SlotsList[16] = new Property(16,"St. James Place",180,14,100,100,90,"orange",SJP);
  
  SlotsList[17] = new Community(17);
  
  int[]TenAve = {14,70,200,550,750,950};
  SlotsList[18] = new Property(18,"Tennessee Avenue",180,14,100,100,90,"orange",TenAve);
  
  int[]NYAve = {16,80,220,600,800,1000};
  SlotsList[19] = new Property(19,"New York Avenue",200,16,100,100,100,"orange",NYAve);
  
  SlotsList[20] = new Slot(20);
  
  int[]KenAve = {18,90,250,700,875,1050};
  SlotsList[21] = new Property(21,"Kentucky Avenue",220,18,150,150,110,"red",KenAve);
  
  SlotsList[22] = new Chance(22);
  
  int[]InAve = {18,90,250,700,875,1050};
  SlotsList[23] = new Property(23,"Indiana Avenue",220,18,150,150,110,"red",InAve);
  
  int[] IlAve = {20,100,300,750,925,1100};
  SlotsList[24] = new Property(24,"Illinois Avenue",240,20,150,150,120,"red",IlAve);
  
  SlotsList[25] = new Railroad(25,"B. & O. Railroad");
  
  int[] AtAve = {22,110,330,800,975,1150};
  SlotsList[26] = new Property(26,"Atlantic Avenue",260,22,150,150,130,"yellow",AtAve);
  
  int[]VentAve = {22,110,330,800,975,1150};
  SlotsList[27] = new Property(27,"Ventnor Avenue",260,22,150,150,130,"yellow",VentAve);
 
  SlotsList[28] = new Utility(28);
  
  int[]MvG = {24,120,360,850,1025,1200};
  SlotsList[29] = new Property(29,"Marvin Gardens",280,24,150,150,140,"yellow",MvG);
  
  SlotsList[30] = new GoToJail(30);
  
  int[]PacAve = {26,130,390,900,1100,1275};
  SlotsList[31] = new Property(31,"Pacific Avenue",300,26,200,200,150,"green",PacAve);
  
  int[] NCAve = {26,130,390,900,1100,1275};
  SlotsList[32] = new Property(32,"North Carolina Avenue",300,26,200,200,150,"green",NCAve);
  
  SlotsList[33] = new Community(33);
  
  int [] PAAve = {28,150,450,1000,1200,1400};
  SlotsList[34] = new Property(34,"Pennsylvania Avenue",320,28,200,200,160,"green",PAAve);
  
  SlotsList[35] = new Railroad(35,"Short Line");
  
  SlotsList[36] = new Chance(36);
  
  int[] PkPl = {35,175,500,1100,1300,1500};
  SlotsList[37] = new Property(37,"Park Place",350,35,200,200,175,"blue",PkPl);
  
  SlotsList[38] = new Tax(38);
  
  int[] BdWk = {50,200,600,1400,1700,2000};  
  SlotsList[39] = new Property(39,"Boardwalk",400,50,200,200,200,"blue",BdWk);  
}

//Format: ID,Name,buyPrice,rentPrice,housePrice,hotelPrice,mortgageV, colorG, int[]housePs