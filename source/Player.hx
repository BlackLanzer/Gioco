package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;

class Player extends FlxSprite
{
	
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
	
		acceleration.y = 100;
		maxVelocity.y = 550;
		maxVelocity.x = 100;
		drag.x = drag.y = 1600;

		makeGraphic(32, 32, FlxColor.BLUE);
		
	}

	
}