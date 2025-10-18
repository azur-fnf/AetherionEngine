package events;


import flixel.FlxG;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class PlayState_Extension extends PlayState
{
    public var bfText:FlxText;
    public var oppText:FlxText;

    override public function create()
    {
        super.create();

        // Aumenta a barra de vida visualmente
        healthBar.scale.x = 1.5;
        healthBarBG.scale.x = 1.5;

        // Cria textos acima dos ícones
        bfText = new FlxText(iconP1.x, iconP1.y - 50, 100, "50%");
        bfText.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, "center");
        add(bfText);

        oppText = new FlxText(iconP2.x, iconP2.y - 50, 100, "50%");
        oppText.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, "center");
        add(oppText);

        // Inicializa seed do random
        Math.random(); // opcional
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        // Ajusta posição dos ícones
        iconP1.x = FlxG.width - 250;
        iconP2.x = 120;

        // Ajusta posição dos textos acima dos ícones
        if (downscroll)
        {
            bfText.x = iconP1.x;
            bfText.y = iconP1.y - 30;
            oppText.x = iconP2.x;
            oppText.y = iconP2.y - 30;
        }
        else
        {
            bfText.x = iconP1.x;
            bfText.y = iconP1.y + 30;
            oppText.x = iconP2.x;
            oppText.y = iconP2.y + 30;
        }

        // Atualiza a porcentagem de vida
        var health:Float = health;
        var bfPercent:Int = Std.int(health * 100);
        var oppPercent:Int = Std.int((1 - health) * 100);
        bfText.text = bfPercent + "%";
        oppText.text = oppPercent + "%";
    }

    override public function onBeatHit()
    {
        super.onBeatHit();

        // Rotação aleatória para ícones (-35 ou 35)
        var bfRotation:Float = if (Math.random() < 0.5) -35 else 35;
        var oppRotation:Float = if (Math.random() < 0.5) -35 else 35;

        iconP1.angle = bfRotation;
        iconP2.angle = oppRotation;

        // Volta ao normal suavemente em 0.2 segundos
        FlxTween.tween(iconP1, {angle: 0}, 0.2, {ease: FlxEase.sineOut});
        FlxTween.tween(iconP2, {angle: 0}, 0.2, {ease: FlxEase.sineOut});
    }
}