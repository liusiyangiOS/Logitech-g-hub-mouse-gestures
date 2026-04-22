# Logitech G Hub Mouse Gestures

[**中文说明**](README_CN.md)

A Lua script that enables mouse gestures in macOS using Logitech G Hub, bringing Master series features to any Logitech gaming mouse.

This script is inspired by [g-hub-mouse-gestures] by Mark van den Berg and has been modified to add browser navigation gestures similar to those found on Logitech's Master series mice.

## Features

- 🖱️ **Mission Control Gestures**: Swipe up/down/left/right to trigger macOS gestures
  - **Up**: Mission Control (Ctrl + Up Arrow)
  - **Down**: Application Windows (Ctrl + Down Arrow)
  - **Left**: Move right a space (Ctrl + Right Arrow)
  - **Right**: Move left a space (Ctrl + Left Arrow)

- 🌐 **Browser Navigation**: Dedicated buttons for quick page navigation
  - **Button 4**: Previous page (Ctrl + Cmd + Left)
  - **Button 5**: Next page (Ctrl + Cmd + Right)

- ⚙️ **Highly Customizable**: Easy configuration for button mappings, gesture sensitivity, and key combinations

## Requirements

- macOS
- Logitech G Hub software
- A Logitech mouse with programmable buttons

### Compatible Mice

This script works with **any Logitech mouse that can be recognized by G Hub**, including but not limited to:

✅ **Fully Supported (Native G Hub mice)**:
- G series gaming mice: G502, G304, G Pro, G403, G604, G703, G903, etc.
- All Logitech gaming mice with programmable buttons

✅ **May Work (Check G Hub compatibility)**:
- Some MX series mice that support G Hub (e.g., MX Master 3, MX Anywhere 3)
- Newer productivity mice with G Hub support

❌ **Not Compatible**:
- Mice that only work with Logitech Options (not G Hub)
- Basic mice without programmable buttons

**How to check**: Open G Hub and see if your mouse appears in the device list. If it does, this script will work!

## Installation

1. **Download and Install Logitech G Hub**
   - Visit [Logitech G Hub Download Page](https://www.logitechg.com/en-us/innovation/g-hub.html)
   - Download and install the software
   - Launch G Hub and connect your mouse

2. **Download the Script**
   - Download `MouseGestures.lua` from this repository
   - Save it to a convenient location on your Mac

3. **Import Script to G Hub**
   - Open Logitech G Hub
   - Select your mouse device
   - Go to the **Assignments** tab
   - Click **System** → **Scripting**
   - Click the **Edit Script** button (or create a new script slot)
   - Copy and paste the content of `MouseGestures.lua`
   - Save the script

4. **Enable the Script**
   - Make sure the script is enabled in G Hub
   - The script will now run automatically when G Hub is active

## Configuration

You can customize the script by editing the configuration variables at the top of `MouseGestures.lua`:

### Button Mapping
```lua
-- The button your gestures are mapped to (G1 = 1, G2 = 2, G3 = 3, etc.)
gestureButtonNumber = 3;

-- Navigation buttons (G4 = 4, G5 = 5, etc.)
navigationNextButtonNumber = 5;  -- Forward navigation
navigationPreButtonNumber = 4;   -- Back navigation
```

### Gesture Sensitivity
```lua
-- Minimum distance the mouse needs to move for gesture recognition (in pixels)
minimalHorizontalMovement = 100;
minimalVerticalMovement = 100;
```

### Enable/Disable Features
```lua
missionControlEnabled = true          -- Mission Control (swipe up)
applicationWindowsEnabled = true      -- Application Windows (swipe down)
moveBetweenSpacesEnabled = true      -- Switch spaces (swipe left/right)
browserNavigationEnabled = true       -- Browser navigation buttons
```

### Debugging
```lua
debuggingEnabeld = false  -- Set to true to see debug messages in G Hub console
```

## Usage

1. **Gesture Mode**: Press and hold the gesture button (default: G3), move your mouse in any direction, then release
   - The script will trigger the corresponding action based on movement direction

2. **Browser Navigation**: Simply click the navigation buttons (default: G4/G5) for quick back/forward

## Customization Tips

### Changing Key Combinations

To modify the key combinations for gestures, edit the corresponding functions:

```lua
-- Example: Change Mission Control from Ctrl+Up to Cmd+F3
function performMissionControlGesture()
    firstKey = "lgui"  -- lgui = left Command key
    secondKey = "f3"
    pressTwoKeys(firstKey, secondKey)
end
```

### Key Name Reference
- `lctrl` / `rctrl` - Left/Right Control
- `lgui` / `rgui` - Left/Right Command (⌘)
- `lalt` / `ralt` - Left/Right Option (⌥)
- `lshift` / `rshift` - Left/Right Shift
- `up`, `down`, `left`, `right` - Arrow keys
- `f1` - `f12` - Function keys

## Troubleshooting

**Script not working:**
- Make sure G Hub is running
- Verify the script is enabled in G Hub
- Check that button numbers match your mouse configuration
- Enable debugging mode to see console output

**Gestures too sensitive/insensitive:**
- Adjust `minimalHorizontalMovement` and `minimalVerticalMovement` values
- Increase values for less sensitivity, decrease for more sensitivity

**Wrong keys being pressed:**
- Verify your key names match the Logitech scripting API
- Check the debug console for error messages

## Credits

- Original inspiration and Windows implementation: [LogitechMouseGestures](https://github.com/wookiefriseur/LogitechMouseGestures) by wookiefriseur
- macOS adaptation: [g-hub-mouse-gestures](https://github.com/mark-vandenberg/g-hub-mouse-gestures) by Mark van den Berg
- Browser navigation enhancements: This repository

## License

Feel free to use, modify, and distribute this script as you see fit.

## Contributing

Issues and pull requests are welcome! If you have ideas for improvements or find bugs, please let me know.

---

## Blogs

- [让你的罗技鼠标秒变 Master 系列：macOS 鼠标手势脚本完整指南](https://www.jianshu.com/p/9782e6dab44e)
- [Author's blog](https://www.jianshu.com/u/e1fee33c72bc)

---

**Enjoy your enhanced Logitech mouse! 🎯**

<!-- external links -->
[g-hub-mouse-gestures]: https://github.com/mark-vandenberg/g-hub-mouse-gestures
