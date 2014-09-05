package ex5;

import javax.swing.JOptionPane;

public class ex5 {

	public static void main(String[] args) {
		/*
		*
		*Crie um algoritmo que peça o nome, a altura e o peso de duas pessoas e apresente o nome da
		*mais pesada e o nome da mais alta.!
		*
		*/

		String [][] arrayPerson = new String[2][3];
		String getInfo;
		String getname;
		
		int weighter;
		int heighter;
		int i;
		int j;
		
		
		
		/*
		 * 
		 *  Uma matriz 2x3 onde:
		 *  2 é o numero de pessoas a ser comparadas e
		 *  3 é o número de qtd de informações recolhidas de cada pessoa; 
		 * 
		 * 
		 * */
		for(i=0; i<2; i++){
			
			System.out.println("Person: "+i);
			
			for(j=0; j<3; j++){
				
				switch(j){
					case 0:
						arrayPerson[i][j] = JOptionPane.showInputDialog("Name: ");
						break;
					case 1:
						arrayPerson[i][j] = JOptionPane.showInputDialog("Height: ");
						break;
					case 2:
						arrayPerson[i][j] = JOptionPane.showInputDialog("Weight: ");
						break;
				}
				
				System.out.println(arrayPerson[i][j] );
				
			}
		}
		
		
		/*
		 * 
		 *  Desmentra o array pessoa e converte o que precisa pra int logo em seguida
		 *  realizando as comparações/calculos e retornando a informação desejada
		 * 
		 * */
		
		if( Integer.parseInt(arrayPerson[0][1]) > Integer.parseInt(arrayPerson[1][1]) ){
			System.out.println("Pessoa mais alta: "+arrayPerson[0][0]);
		}else{
			System.out.println("Pessoa mais alta: "+arrayPerson[1][0]);
		};
		
		
		if( Integer.parseInt(arrayPerson[0][2]) > Integer.parseInt(arrayPerson[1][2]) ){
			System.out.println("Pessoa mais pesada: "+ arrayPerson[0][0]);
		}else{
			System.out.println("Pessoa mais pesada: "+arrayPerson[1][0]);
		};
	}

}