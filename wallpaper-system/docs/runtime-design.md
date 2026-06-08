# Animated Wallpaper Runtime Design

## Goal

Render animated wallpaper packages inside Caelestia without using mpvpaper.

## Package Format

```text
example.wall/
├── frames/
├── metadata.json
├── preview.jpg
└── source.mp4
```

## Theme Source

preview.jpg

Used by:

* caelestia wallpaper set
* theme-sync
* Limine
* future targets

## Animation Source

frames/

Rendered by AnimatedWallpaper.qml.

## Runtime Ownership

Caelestia owns wallpaper rendering.

AnimatedWallpaper.qml is loaded through Wallpaper.qml.

## Success Criteria

* Smooth playback at 12 FPS
* Low CPU usage
* Acceptable RAM usage
* No external wallpaper daemon
* No mpvpaper dependency

```
```

