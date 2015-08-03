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
	
	override public function create():Void
	{
		player = new Player(50, 0);
		
		add(player);
		super.create();
	}
	
	override public function destroy():Void
	{
		player.destroy();
		super.destroy();
	}

	override public function update():Void
	{
		
		
		// gravity
		player.acceleration.y = 100;
		
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
		FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		super.update();
	}	
	
	private function handleInput():Void
	{
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