# AVA: Angry Virtual Avatar
CAP3032 Video Game Group Project
Project Demo Link: https://www.youtube.com/watch?v=lEFn10HNA3g

Project Name: AVA - Angry Virtual Avatar
Team Members: Aayesha Islam, Vishwa Krishnan, Ahmed Ebrahim

1. What is the nature of the gameplay? That is, what challenges will the player face? What actions will the player take to overcome those challenges?

The nature of the gameplay involves the player having to throw as many weapons (swords) as possible onto a rotating circular robot The challenge for the player is to get the perfect timing to shoot the sword so that it lands on an empty space on the board and not on an already occupied space. For each level, the player has to place a specific number of swords on the board to clear it. Every time a player places all the swords on the rotating circle, the swords are cleared and a new level starts with increasing difficulty, such as obstacles on the robot that the sword should not land on, increasing speed of the rotating robot, and more.


 2. What is the victory condition for the game? What is the player trying to achieve?

The player tries to achieve the following conditions: 
Getting the highest score possible (either easy or hard mode)
Score is the number of knives cleared per level.

 3. What is the player's interaction model (mouse/keyboard)?

All user interactions will involve only mouse clicking.

 4. What is the general structure of the game? What is going on in each mode, and what function does each mode fulfill?

The game is divided into two difficulty modes:
Easy: Every board that is cleared increases the number of swords by a random amount (between 5 to 11) and the speed will increase (not by a significant amount).
Hard: Similar to easy mode, however, the robot circle changes rotational speed at random times, obstacles come and go, and every 10 levels the user encounters a boss.

The user loses if the newly shot sword hits an existing sword or any other obstacle. In such cases, the game restarts from level 1.

 5. Does the game have a narrative or story as it goes along? If so, summarize the plot. 

The game will have a simple narrative. A.V.A, an acronym for “Angry Virtual Avatar” (named after the first letters of all the names of our group members), is a killer robot that plans to take over the planet of CAP3032. The player is assigned with taking down A.V.A by attempting to stop the robot by impaling it with laser swords. The game goes on infinitely as A.V.A. is a powerful robot that never dies.
6. Why would anyone want to play this game? What sort of people would be attracted to this game?

This game is a great stress relief and is also very addicting. The high score objective gives the player the incentive to beat other player’s high scores. Overall, the game is aimed for those that seek mindless fun and have a competitive spirit within them.



Download instructions:


Download and extract the zip file containing code, images, and sound files. Install the Sound library in Processing by going to Sketch->Import Library-> Sound by the Processing Foundation. Click the Run button to start the program.

Game Menu:


Menu consists of “START”, “HELP”, and “QUIT”. The start button starts the game, the help button provides instructions and the game’s storyline, and the quit button quits the program. Once the start button is pressed, the user is prompted to choose between easy and hard mode.

Game Logistics:


Player opens a game and is given three options: start the game, get help, or exit the game.
If the player chooses the help button, they will be shown a new screen that explains the story of the game and how to play (user manual). They can then click back to return to the menu screen. If the player clicks quit, they will exit from the game. If the player clicks start, they will be prompted to choose from either easy mode or hard mode.
Once either easy or hard mode is selected, the game begins. In both modes, the player must place bombs onto the rotating robot without placing a bomb that collides with already-placed bombs. If a bomb is placed, it rotates around at the same speed as the rotating robot. Every time a bomb is placed, the player’s score increments by 1. There are also waves, and in each wave, the player is assigned to place a random number of bombs onto the rotating robot. Once successfully placing all designated bombs, the player moves on to the next round. In hard mode, the speed of the rotating robot is significantly faster, and more bombs need to be placed. Also, the direction of the rotating robot can change every level.
The wave and number of bombs to be placed is then reset, and a new background is shown. This process continues until the player accidentally collides a bomb with another bomb. Once this happens, an end screen is displayed, showing their score (overall number of bombs placed on all waves), number of waves reached, and their highest score while playing the current instance of the game.

Story:


The game has a simple narrative. A.V.A, an acronym for “Angry Virtual Avatar” (named after the first letters of all the names of our group members), is a killer robot that plans to take over the planet of CAP3032. The player is assigned with taking down A.V.A by attempting to stop the robot by attacking it with bombs. The game goes on infinitely as A.V.A. is a powerful robot that never dies.

Code:


Three classes (Bomb, Board, and Modes) and a Main class. 
In the Bomb class, the functionality of each bomb is determined including the movement when each is shot, when they hit the robot, and when they rotate. In the Board class, the functionality of the robot is determined, such as its rotation speed, change in levels and score, reset ability, and text display. The main contains the initialization of objects, loading of images and sounds, menu toggling, user interaction and clicking functionality, and use of the two classes. The Modes class is used to call two different board objects and change the speed and number of bombs according to the difficulty mode chosen. Easy mode has a slower robot speed and less bombs to place per wave, while Hard mode has a faster, more aggressive robot speed with changing directions while having to place more bombs.

