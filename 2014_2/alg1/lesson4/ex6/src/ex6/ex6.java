package ex6;

import javax.swing.JOptionPane;

public class ex6 {
	
	/*
	 * 
	 * Crie um algoritmo para ler uma letra do alfabeto e mostrar uma mensagem: se é vogal ou
	 * consoante.!
	 *
	 */

	public static void main(String[] args) {
		String letter = JOptionPane.showInputDialog("Please, enter a char");
		
		switch(letter.toLowerCase() ){
			case "a":
				System.out.println(letter+" é vogal");
				break;
			case "e":
				System.out.println(letter+" é vogal");
				break;
			case "i":
				System.out.println(letter+" é vogal");
				break;
			case "o":
				System.out.println(letter+" é vogal");
				break;
			case "u":
				System.out.println(letter+" é vogal");
				break;
			default:
				System.out.println(letter+" Não é vogal");
				break;				
		}

	}

}