import java.util.*;
import javax.swing.*;

import java.awt.*;
import java.awt.event.*;

public class PlayerSet extends JFrame{

    public int NumPlayer;
    private static String [] AvailableTokens = {};
    
    public PlayerSet(){
	String [] options = {"2 Players","3 Players", "4 players"};

	
	NumPlayer = JOptionPane.showOptionDialog(null,"Select the Number of Players","Players Selection",0,JOptionPane.QUESTION_MESSAGE,null,options,0)+2;
    }
}
