package;
import flixel.FlxObject;
import flixel.tile.FlxTilemap;
import flixel.util.FlxStringUtil;
import openfl.Assets;

/**
 * ...
 * @author Alessandro Bertoldi
 */
class Level
{
	public var intMap:Array<Int>;
	public var tileMap:FlxTilemap;

	public function new() 
	{
		intMap = new Array<Int>();
		for (i in 0...50)
		{
			intMap[i] = Std.random(2)+1;
			trace(intMap[i]);
		}
		tileMap = new FlxTilemap();
		tileMap.loadMap(Assets.getText("assets/levels/02.csv"), "assets/images/level_tiles.png", 34, 35);
		
	}
	
}