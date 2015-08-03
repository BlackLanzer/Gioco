package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKeyList;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var player:Player;
	private var level:Level;
	
	override public function create():Void
	{
		player = new Player(0, 0);
		level = new Level();
		
		add(level.tileMap);
		add(player);
		
		//FlxG.camera.setBounds(0, 0, Reg.gameWidth, Reg.gameHeight);
		FlxG.camera.height = Reg.gameHeight;
		FlxG.camera.setPosition(player.x, Reg.gameHeight / 2);
		super.create();
	}
	
	override public function destroy():Void
	{
		player.destroy();
		super.destroy();
	}

	override public function update():Void
	{
		FlxG.collide(level.tileMap, player);
		
		// gravity
		player.acceleration.y = 1000;
		
		// temporaneamente resta dentro lo schermo (circa)
		if (player.y >= Reg.gameHeight - player.height)
		{
			player.velocity.y = 0;
			player.acceleration.y = 0;
		}
		if (player.x < 0 || player.x > Reg.gameWidth - player.width)
		{
			player.velocity.x = 0;
			player.acceleration.x = 0;
		}
		
		handleInput();
		//FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		FlxG.camera.setPosition(-player.x, Reg.gameHeight / 2);
		
		super.update();
	}	
	
	private function handleInput():Void
	{
		if (FlxG.keys.anyJustPressed(["ESCAPE"]))
		{
			#if neko
			Sys.exit(0);
			#end
		}
		var moving:Bool = false;
		if (FlxG.keys.anyPressed(["RIGHT", "D"]))
		{
			player.acceleration.x = 200;
			moving = true;
		}
		if (FlxG.keys.anyPressed(["LEFT", "A"]))
		{
			player.acceleration.x = -200;
			moving = true;
		}
		if (FlxG.keys.anyJustPressed(["UP", "W"]))
		{
			// TODO fare il salto decente
			player.acceleration.y -= 10000;
		}
		
		if (!moving)
		{
			player.acceleration.x = 0;
		}
	}
}