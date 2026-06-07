# Wallpaper Package Specification

## Goal

Provide a unified wallpaper format supporting:

- Static images
- Animated wallpapers
- Theme generation
- Boot theme synchronization

---

## Static Wallpaper

Example:

forest.jpg

Theme source:
- forest.jpg

---

## Animated Wallpaper Package

Example:

cyberpunk.wall/

Required structure:

cyberpunk.wall/
├── metadata.json
├── preview.jpg
├── source.mp4
└── frames/

metadata.json:

{
  "type": "animated",
  "fps": 12,
  "loop": true,
  "theme_source": "preview.jpg"
}

preview.jpg:
- Used for color generation
- Used for Limine
- Used for SDDM
- Used for Plymouth

frames/:
- Runtime animation frames

## Animated Wallpaper Limits

Defaults:

- Duration: 10 seconds
- Maximum Duration: 30 seconds
- FPS: 12

Duration may be overridden using:

wall-build -d <seconds>
wall-build --duration <seconds>
