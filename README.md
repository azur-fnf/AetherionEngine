<<<<<<< HEAD
# Friday Night Funkin' - Psych Engine
Engine originally used on [Mind Games Mod](https://gamebanana.com/mods/301107), intended to be a fix for the vanilla version's many issues while keeping the casual play aspect of it. Also aiming to be an easier alternative to newbie coders.

## Installation:
You must have [the most up-to-date version of Haxe](https://haxe.org/download/), seriously, stop using 4.1.5, it misses some stuff.

Follow a Friday Night Funkin' source code compilation tutorial, after this you will need to install LuaJIT.

To install LuaJIT do this: `haxelib git linc_luajit https://github.com/nebulazorua/linc_luajit` on a Command prompt/PowerShell

...Or if you don't want your mod to be able to run .lua scripts, delete the "LUA_ALLOWED" line on Project.xml


If you get an error about StatePointer when using Lua, run `haxelib remove linc_luajit` into Command Prompt/PowerShell, then re-install linc_luajit.

If you want video support on your mod, simply do `haxelib install hxCodec` on a Command prompt/PowerShell

otherwise, you can delete the "VIDEOS_ALLOWED" Line on Project.xml

## Credits:
* Shadow Mario - Programmer
* RiverOaken - Artist
* Yoshubs - Assistant Programmer

### Special Thanks
* bbpanzu - Ex-Programmer
* shubs - New Input System
* SqirraRNG - Crash Handler and Base code for Chart Editor's Waveform
* KadeDev - Fixed some cool stuff on Chart Editor and other PRs
* iFlicky - Composer of Psync and Tea Time, also made the Dialogue Sounds
* PolybiusProxy - .MP4 Video Loader Library (hxCodec)
* Keoiki - Note Splash Animations
* Smokey - Sprite Atlas Support
* Nebula the Zorua - LUA JIT Fork and some Lua reworks
_____________________________________

# Features

## Attractive animated dialogue boxes:

![](https://user-images.githubusercontent.com/44785097/127706669-71cd5cdb-5c2a-4ecc-871b-98a276ae8070.gif)


## Mod Support
* Probably one of the main points of this engine, you can code in .lua files outside of the source code, making your own weeks without even messing with the source!
* Comes with a Mod Organizing/Disabling Menu.


## Atleast one change to every week:
### Week 1:
  * New Dad Left sing sprite
  * Unused stage lights are now used
### Week 2:
  * Both BF and Skid & Pump does "Hey!" animations
  * Thunders does a quick light flash and zooms the camera in slightly
  * Added a quick transition/cutscene to Monster
### Week 3:
  * BF does "Hey!" during Philly Nice
  * Blammed has a cool new colors flash during that sick part of the song
### Week 4:
  * Better hair physics for Mom/Boyfriend (Maybe even slightly better than Week 7's :eyes:)
  * Henchmen die during all songs. Yeah :(
### Week 5:
  * Bottom Boppers and GF does "Hey!" animations during Cocoa and Eggnog
  * On Winter Horrorland, GF bops her head slower in some parts of the song.
### Week 6:
  * On Thorns, the HUD is hidden during the cutscene
  * Also there's the Background girls being spooky during the "Hey!" parts of the Instrumental

## Cool new Chart Editor changes and countless bug fixes
![](https://github.com/ShadowMario/FNF-PsychEngine/blob/main/docs/img/chart.png?raw=true)
* You can now chart "Event" notes, which are bookmarks that trigger specific actions that usually were hardcoded on the vanilla version of the game.
* Your song's BPM can now have decimal values
* You can manually adjust a Note's strum time if you're really going for milisecond precision
* You can change a note's type on the Editor, it comes with two example types:
  * Alt Animation: Forces an alt animation to play, useful for songs like Ugh/Stress
  * Hey: Forces a "Hey" animation instead of the base Sing animation, if Boyfriend hits this note, Girlfriend will do a "Hey!" too.

## Multiple editors to assist you in making your own Mod
![Screenshot_3](https://user-images.githubusercontent.com/44785097/144629914-1fe55999-2f18-4cc1-bc70-afe616d74ae5.png)
* Working both for Source code modding and Downloaded builds!

## Story mode menu rework:
![](https://i.imgur.com/UB2EKpV.png)
* Added a different BG to every song (less Tutorial)
* All menu characters are now in individual spritesheets, makes modding it easier.

## Credits menu
![Screenshot_1](https://user-images.githubusercontent.com/44785097/144632635-f263fb22-b879-4d6b-96d6-865e9562b907.png)
* You can add a head icon, name, description and a Redirect link for when the player presses Enter while the item is currently selected.

## Awards/Achievements
* The engine comes with 16 example achievements that you can mess with and learn how it works (Check Achievements.hx and search for "checkForAchievement" on PlayState.hx)

## Options menu:
* You can change Note colors, Delay and Combo Offset, Controls and Preferences there.
 * On Preferences you can toggle Downscroll, Middlescroll, Anti-Aliasing, Framerate, Low Quality, Note Splashes, Flashing Lights, etc.

## Other gameplay features:
* When the enemy hits a note, their strum note also glows.
* Lag doesn't impact the camera movement and player icon scaling anymore.
* Some stuff based on Week 7's changes has been put in (Background colors on Freeplay, Note splashes)
* You can reset your Score on Freeplay/Story Mode by pressing Reset button.
* You can listen to a song or adjust Scroll Speed/Damage taken/etc. on Freeplay by pressing Space.
=======
![AetherionEngine](docs/img/AetherionEngineLogo.png)

![Version](https://img.shields.io/badge/version-0.2.5-brightgreen)
![Language](https://img.shields.io/badge/made%20with-Haxe-orange)
![License](https://img.shields.io/github/license/azur-fnf/LeakerEngine)

---

### 🌀 About Aetherion Engine

**Aetherion Engine** is a fork of [Psych Engine](https://github.com/ShadowMario/FNF-PsychEngine), built to **improve performance**, **add new features**, and **enhance customization**.  
It keeps the original modding spirit while offering **smoother gameplay**, **better tools**, and **more creative freedom** for Friday Night Funkin’ mods.


---

## 🧩 Installation

See the [Build Instructions](docs/BUILDING.md) to compile and run the engine.

---

## ⚙️ Customization

You can easily toggle engine features (like *Lua Scripts* or *Video Cutscenes*) inside the `Project.xml` file.

To disable a feature:
```
<!-- Example: disable video cutscenes -->
<!-- <define name="VIDEOS_ALLOWED" /> -->
```

Same goes for `LUA_ALLOWED` and other optional components.

---

## 💡 Softcoding (.lua / .hx)

Learn how to use all **212 PlayState functions** in your mod on the
👉 [Psych Engine Lua Wiki](https://shadowmario.github.io/psychengine.lua) 
> Yeah i don't wanna to make an copy the wiki

---

## 👥 Credits

### Main Developers

* **Azurion** — Aetherion Engine Creator & Maintainer

---
* **Shadow Mario** — Psych Engine base code
* **Riveren** — Art & Animation (Psych Engine)

### Special Thanks

* **bbpanzu**, **crowplexus**, **Kamizeta**, **Keoiki**, **EliteMasterEric**, **MAJigsaw77**, **iFlicky**, **KadeDev**, **CheemsAndFriends**, **superpowers04**, **Ezhalt**, **MaliciousBunny**, and others who contributed to the Psych Engine foundation.

---

## 🚀 Features

### ✨ New and Improved Systems

* Optimized for better FPS and reduced memory usage
* Enhanced Lua API and modular customization
* Streamlined chart editor and improved workflow
* More accurate timing and input handling
* Optional modern UI/UX elements

### 🛠️ Modding & Tools

* Create and manage mods directly in-engine
* Enable/disable scripts, menus, and effects via XML
* Built-in achievement system and credit manager
* Extended character and stage customization

---

## 📸 Screenshots

![Main Menu](docs/img/MainMenu.png)
![Chart Editor](docs/img/chart.png)
![Credits Menu](docs/img/credits.png)

---

## 📜 License

LeakerEngine is distributed under the same license as Psych Engine.
You are free to modify, fork, and contribute — just remember to credit the original authors.

---

> *Aetherion Engine — Performance, Power, and Freedom for FNF Modding.*
>>>>>>> 50b0f32771f726d57428a8ca94702fff9e928684
