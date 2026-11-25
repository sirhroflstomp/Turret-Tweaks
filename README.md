# TurretTweaks

A client-side BepInEx mod for [SPT](https://www.sp-tarkov.com/) that makes the mounted turrets (the AGS and the Utes)
less of a chore to use.

## What it does

- **Normal turning speed.** Vanilla turrets cap every turn at 0.5 degrees per frame and use a much lower sensitivity than
  the rest of the game. With this mod a turret turns at the same mouse sensitivity as anything else.
- **Wider aim limits.** Adds 30 degrees on every side by default. Left/right and up/down are separate sliders.
- **No sticking at the limits.** With the turn-speed cap gone it's easy to slam into an aim limit; the mod makes you slide
  along the edge instead of freezing.
- **Closer, tighter view.** A narrower field of view and a camera that sits closer to the sight while you aim.
- **Mouse wheel zoom.** Scroll while aiming a turret to change the magnification between 1x and 4x. Turning slows down as
  you zoom so it stays controllable.

Everything is adjustable with sliders in the BepInEx configuration manager (F12 by default).

## Install

1. Download the latest release.
2. Extract it into your SPT folder so that `TurretTweaks.dll` ends up in `BepInEx/plugins`.
3. Start the game.

There is no server component.

If you used a development build of this mod earlier, delete `BepInEx/config/com.sirhroflstomp.turrettweaks.cfg` once so the
new settings are created.

## Configuration

| Section | Setting | Default | Range | |
| --- | --- | --- | --- | --- |
| Turning | SensitivityMultiplier | 1 | 0.1 - 3 | Turret sensitivity compared to normal. 1 is identical. |
| Turning | StopAtLimits | on | | Slide along aim limits instead of getting stuck. |
| Aim limits | ExtraLeftRightAngle | 30 | 0 - 90 | Degrees added to the left and right limits. |
| Aim limits | ExtraUpDownAngle | 30 | 0 - 90 | Degrees added above and below. |
| View | AimFovReduction | 25 | 0 - 60 | Degrees taken off the field of view while aiming. |
| View | SightForwardOffset | 0.05 | -0.5 - 0.5 | Meters the camera moves toward the sight. |
| Zoom | Enabled | on | | Mouse wheel zoom while aiming. |
| Zoom | MinZoom / MaxZoom | 1 / 4 | 1 - 8 | Zoom range. |
| Zoom | ZoomStep | 0.5 | 0.25 - 1 | Zoom change per wheel notch. |
| Zoom | ScaleSensitivityWithZoom | on | | Slow turning down when zoomed in. |

The aim limit changes apply when you mount a turret, so get off and back on after changing them.

## Notes

- Tested on SPT 4.1.6. The mod finds the game's classes by name, so a game update that renames them will turn the
  affected feature off and log a warning instead of crashing.
- The zoom works by narrowing the camera's field of view. It isn't a real scope picture.
- Bots that use turrets get the wider limits too.
- The AGS lands its grenades a little up and to the left of where the sight points. That is how the game does it and
  this mod doesn't change it.

## Building

You need the .NET SDK and an SPT install to build against.

1. Copy `GameDir.props.example` to `GameDir.props` and set `GameDir` to your SPT folder.
2. Run `dotnet build -c Release`. The DLL is copied into `BepInEx/plugins` of that install.
3. `./package.ps1` builds and makes a release zip in `dist/`.

## License

[MIT](LICENSE)
