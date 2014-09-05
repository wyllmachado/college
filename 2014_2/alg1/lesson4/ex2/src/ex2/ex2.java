package ex2;

import javax.swing.JOptionPane;

public class ex2 {

	public static void main(String[] args) {
		
		
		//Variables Declaration
		String  getNumber = JOptionPane.showInputDialog("Please, enter a number"),
				negPos,
				oddEven;
		
		if( Integer.parseInt(getNumber)%2 == 0){
			oddEven = "Even Number";
		}else{
			oddEven = "Odd";
		}
		
		
		if(Integer.parseInt(getNumber) >= 0){
			negPos = "Positive Number";
		}else{
			negPos = "Negative Number";
		}	
		
		
		System.out.println(oddEven);
		System.out.println(negPos);

	}

}