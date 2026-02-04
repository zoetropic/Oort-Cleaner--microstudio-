

The code in this project was written for the ***MicroStudio*** game engine, which utilizes a unique derivative of LUA known as *microscript*. Many of the concepts and functions of LUA code are reflected in the microscript code, and this repo exists mostly as a window into the structure of the project that I wrote (almost) entirely from scratch. 

The scripts in the *screens* folder are the most abstract outside of the context of the engine, 

The functions in the *helpers.ms* file, with the exception of **VectorSelector**, are akin to a common library that was provided by the MicroStudio community to resolve common logical challenges of the MicroStudio engine. 

**VectorSelector** is a function I wrote to handle spawning UFOs and setting their path of travel, which turned out to be a unique challenge to resolve against the player position so that UFOs didn't spawn on top of the player.

It turns out that *Asteroids* (c Atari) is much more complex in it's logic than the average 2D sidescroller or top-down game, and I am proud to say that I managed to work it out through inference and sheer force of will, as there exist no commonly available tutorials for making an Asteroids clone.

If you'd like to see the game in action, here is the private link: https://microstudio.io/Hek80/oortcleaner/VV9SM22E/

I hope to refactor this game into a different engine or perhaps as a low-level code OpenGL project in the future.
