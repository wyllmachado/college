package ex3;

import javax.swing.JOptionPane;

public class ex3 {

	public static void main(String[] args) {
		
		int i,
			larger,
			smaler;
		
		String getNumber;
		
		
		getNumber = JOptionPane.showInputDialog("Please, enter a number");
		
		larger = Integer.parseInt(getNumber);
		smaler = Integer.parseInt(getNumber);
		
		for(i=0; i<4; i++){
			getNumber = JOptionPane.showInputDialog("Please, enter a number");
			
			if(Integer.parseInt(getNumber) >= larger){
				larger = Integer.parseInt(getNumber);
			}
			
			if(Integer.parseInt(getNumber) <= smaler){
				smaler = Integer.parseInt(getNumber);
			}
			
		}
		
		System.out.println("Large number: "+ larger);
		System.out.println("Smaler number: "+ smaler);		

	}

}
