# Defold Spotlight Projector Effect

## Join The Room 606!
> ![TG Group QR](doc/img/tg_qr.png)
>
> 🦄 Come join our friendly 🇷🇺 ru-speaking community in `Telegram`: [@TheRoom606](https://t.me/TheRoom606)
> 
> A chat: https://t.me/TheRoom606Chat

## Description:
This `Defold` game project represents nice and commonly used visual effect of hightliting zones of interest for the players - widely used in casual, hybrid casual mobile games when onboarding the player in first tutorial steps.

| Compatibility | Version  |
|---------------|----------|
| ✅ Defold     | `1.10.4` |

![Demo GIF](doc/img/spotlight_effect.gif)

🎮 **[Play Demo Here](https://zugzug90.github.io/defold-projector-spotlight-effect/)**

## How to use
1. Take all assets from folders `materials`, `shaders` into your project
2. Create game object, add `sprite` component to it
3. For the added `sprite` component assign a material named `projector_spotlight_material.material`
4. Tweak the size of the texture image (`white_bg_x1280_720.png`) if needed to fit your game needs - currently it is just white image matching the project Display Settings (1280x720)
5. Control the positions, tint color and number of spotlight nodes programmatically in your *.script files in the update(dt) loop or using timer. Look into `projector_spotlight_controller.script` as a basic usage case.
6. You can hide and show the effect by hiding the sprite and additionally control the transparency of whole effect via call:
   
   ```lua
   go.set(projector_spotlight_sprite_id, "transparency", vmath.vector4(1, 0, 0, 0))
   ```

   ```lua
   1 - means 100 % visible
   0 - means 0 % visible.
   ```
   
   So the one can play around wuth any values in between.

## Project Dependencies and Prerequisits
1. Project uses [Druid](https://github.com/Insality/druid) and [Defold Event](https://github.com/Insality/defold-event). But just for demo purposes. The one can use any other custom solution for managing UI controls.

## What's implemented:
1. Hide/Show Fade Screen
1. Configurable amount (up to 20) and radius of the projector spots 
3. Programmatic control of the amount, color and radius of the projector spots

## Out of scope:
1. Tint of the fade. Current is bluish. Can be changed currently in the fragment shader - `projector_spotlight_2d_shader`.
1. Light diffusion behaviors - currently hardcoded as is. No sets of behavior - just one variant currently.

### Credits 

1. Thanks to the Telegram buddy [@brace_r](https://t.me/brace_r) for the fragment and vertex shader programs as a starter points.
1. Used free icons from: 

<a href="https://www.flaticon.com/free-icons/cute" title="cute icons">Cute icons created by Freepik - Flaticon</a>
