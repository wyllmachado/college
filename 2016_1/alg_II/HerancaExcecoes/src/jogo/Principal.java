package jogo;

import java.io.IOException;

import com.senac.SimpleJava.Graphics.Canvas;
import com.senac.SimpleJava.Graphics.GraphicApplication;
import com.senac.SimpleJava.Graphics.Image;
import com.senac.SimpleJava.Graphics.Resolution;

public class Principal extends GraphicApplication{

	private Image axe;//http://pt.dotabuff.com/heroes/axe
	private Image legion;//http://pt.dotabuff.com/heroes/legion-commander
	private Image ancient;//https://i.ytimg.com/vi/D7BFF9o3FT4/maxresdefault.jpg
	private Image dire;//https://hydra-media.cursecdn.com/dota2.gamepedia.com/thumb/8/8c/Dire_Ancient.jpg/300px-Dire_Ancient.jpg.png?version=654b63087ab51380096d971b7da139c8
	
	@Override
	protected void setup() {
		setResolution(Resolution.HIGHRES);
		try{
			//encurtar o caminha da pasta usando ./imagem.jpg
			axe  = new Image("C:\\Users\\Padilha\\workspace\\HerancaExcecoes\\src\\jogo\\axe.jpg");
			legion = new Image("C:\\Users\\Padilha\\workspace\\HerancaExcecoes\\src\\jogo\\legion.jpg");
			ancient = new Image("C:\\Users\\Padilha\\workspace\\HerancaExcecoes\\src\\jogo\\ancient.jpg");
			dire = new Image("C:\\Users\\Padilha\\workspace\\HerancaExcecoes\\src\\jogo\\dire.jpg");
		}catch(IOException e) {
			e.printStackTrace();
			endLoop();
		}
	}
	
	@Override
	protected void draw(Canvas canvas) {
		canvas.drawImage(axe, 500, 500);
		canvas.drawImage(legion, 310, 0);
		ancient.resize(300, 170);
		canvas.drawImage(ancient, 0, 0);
		canvas.drawImage(dire, 500, 0);
	}

	@Override
	protected void loop() {
		// TODO Auto-generated method stub
	}

}
