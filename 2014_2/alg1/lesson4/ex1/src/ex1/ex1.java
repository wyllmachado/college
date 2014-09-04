package ex1;

import javax.swing.JOptionPane;

public class ex1 {

	public static void main(String[] args) {
		
		//Variables Declaration
		int n3 = 3,
			i;
		
		String  text = "The numbers entered ",
				getNumber;
		
		
		for(i=0; i<n3; i++){
			getNumber = JOptionPane.showInputDialog("Please, enter a number");			
			text += getNumber +", ";
		}
		
		
		System.out.println(text);

	}

}
