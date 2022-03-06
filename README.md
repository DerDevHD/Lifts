# Lifts
A fivem script resource which allows you to add lifts/elevators to your server. No ESX is required.

<img src="https://img.icons8.com/ios-filled/100/000000/elevator-doors.png"/>

# Setup
The setup is quite easy. 
1. Downlaod the [latest release](https://github.com/DerDevHD/Lifts/releases/latest)
2. Drag the script into your server *resources*
3. Add `start lifts` to your *server.cfg*
4. Configure the script
    - Change your locale  
    *At the time, only german or english is supported*
    - Add new lifts  
    *Example*  
        ```lua
        { vector3(135.45, -763.8, 45.8), vector3(135.45, -763.8, 234.2) } -- FIB Building
        ```
5. Done

# Example configuration
```lua
Config = {}

Config.Locale = 'en'

Config.AllowSounds = true

Config.Lifts = {{
        vector3(135.45, -763.8, 45.8),
        vector3(135.45, -763.8, 234.2)
    },{ -- FIB Building
        vector3(471, -985, 30.7),
        vector3(464, -984.2, 35.9),
        vector3(464, -984.2, 39.9)
    } -- Police Station
}
```

# Adding new locales
*locale.lua*
```lua
Locale.IDENTIFIER = {
    usage = "example usage",
    topfloor = "example error message 1",
    bottomfloor = "example error message 2"
}
```
*config.lua*
```lua
Config.Locale = "identifier"
```

---

If you have suggestions for new locales, please open an [issue](https://github.com/DerDevHD/Lifts/issues/new).

# Contact
Discord: `DerDevHD#5411`  
Discord Server: [Coming Soon](#about:blank)
