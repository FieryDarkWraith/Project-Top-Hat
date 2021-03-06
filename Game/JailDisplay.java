import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class JailDisplay extends JFrame implements ActionListener{
    private Player player;
    private Container pane;
    public boolean done;
    
    public JailDisplay(Player entry){
	this.player = entry;
	this.done = false;

	this.setTitle("Player "+(player.getIndex()+1)+", you have to go to Jail.");
	this.setSize(400,400);
	this.setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);

	pane = this.getContentPane();
	pane.setLayout(new BoxLayout(pane,BoxLayout.Y_AXIS));

	JPanel p1 = new JPanel();
	p1.setLayout(new BoxLayout(p1,BoxLayout.Y_AXIS));
	p1.setAlignmentX(Component.CENTER_ALIGNMENT);

	JLabel l1 = new JLabel("You have landed in Jail!" );
	l1.setAlignmentX(Component.CENTER_ALIGNMENT);
	JLabel l2 = new JLabel("You will be stuck here for three turns");
	l2.setAlignmentX(Component.CENTER_ALIGNMENT);

	p1.add(l1);
	p1.add(l2);
	
	JPanel p2 = new JPanel();
	p2.setLayout(new BoxLayout(p2,BoxLayout.X_AXIS));
	p2.setAlignmentX(Component.CENTER_ALIGNMENT);

	JButton b1 = new JButton("OK");
	b1.addActionListener(this);
	b1.setActionCommand("OK");

	//JButton b2 = new JButton("Pay");
	//b1.addActionListener(this);
	//b1.setActionCommand("Pay");
	
	p2.add(b1);
	
	//JLabel money = new JLabel("Amount of Money: "+player.getMoney());

	pane.add(p1);
	//pane.add(money);
	pane.add(p2);
    }

    public void actionPerformed(ActionEvent e){
	String event = e.getActionCommand();
	if(event.equals("OK")){
	    player.changeLocation(10);
	    player.setXY(50,750);
	    player.changeJailTime(3);
	}
	terminate();
    }

    public void terminate(){
	this.done = true;
    }
}
