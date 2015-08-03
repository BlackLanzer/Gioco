package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;

class Player extends FlxSprite
{
	
	public function new(x:Float, y:Float)
	{
		super(x, y);
	
		acceleration.y = 100;
		maxVelocity.y = 150;
		maxVelocity.x = 100;
		drag.x = drag.y = 1600;

		makeGraphic(24, 24, FlxColor.BLUE);
		
	}

	
}