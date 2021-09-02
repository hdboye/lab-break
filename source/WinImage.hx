package;

import flixel.util.FlxTimer;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;

class WinImage extends MusicBeatState
{
    var _img:FlxSprite;
    var _ret:FlxState;
    var _dat:Any;
    var press:Bool = false; //idk why i just hope it do something
    public function new(imagePath:String, returnTo:FlxState, ?data:Any = null)
    {
        super();

        _img = new FlxSprite(0, 0).loadGraphic(imagePath);
        _ret = returnTo;
        _dat = data;
    }
    override public function create():Void
    {
        super.create();

        add(_img);
    }
    
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        if(FlxG.keys.justPressed.ENTER && !press){
            press = true;
            if(_dat == true){
                var poop:String = Highscore.formatSong('stay', 1);
			    trace(poop);
			    PlayState.SONG = Song.loadFromJson(poop, 'stay');
    			PlayState.isStoryMode = true;
	    		PlayState.storyDifficulty = 1;
		    	PlayState.storyWeek = 1;
			    trace('CUR WEEK' + PlayState.storyWeek);
            }
            FlxG.switchState(_ret);
        }
    }
}