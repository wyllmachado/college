package ex4;

import javax.swing.JOptionPane;

public class ex4 {

	public static void main(String[] args) {
		
		int [] myArray = new int[3];
		int arrayQtd = myArray.length,
			i,
			j,
			smaler,
			tmp;
		
		
		String getNumber;
		
		
		for(i=0; i<3; i++){
			getNumber = JOptionPane.showInputDialog("Please, enter a number");
			myArray[i] = Integer.parseInt(getNumber);
		}
		
		
		for(i=0; i<arrayQtd; i++){
			smaler = i;
			
			for(j=i+1; j<arrayQtd; j++){
				if(myArray[j ] < myArray[smaler]) smaler = j;
			}
			
			
			if(smaler != i){
				tmp = myArray[i];
				myArray[i] = myArray[smaler];
				myArray[smaler] = tmp;
			}
		}
		
		
		for(i=0; i<arrayQtd; i++) System.out.println(myArray[i]);

	}

}