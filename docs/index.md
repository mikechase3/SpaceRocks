# Asteroids - Cosmic Bounty
Michael Chase Game Design Document for `Space-Rocks`


### Game Overview
![](CleanShot%202024-10-25%20at%2023.37.19@2x.png)
* **Title**: Aestroids - Cosmic Bounty
* **Genre**: Arcade
* **Target Audience**: Space Rocks is intended to be played nostalgic players, primarily those who are fond of classic games and enjoy retro gaming experiences.
* **Platform**: the platform game will be developed for Godot-supported devices which typically use qwerty keyboards, such as Windows desktop, universal windows platform, macOS, Linux (Ubuntu), and HTML5. The game will be unavailable on Windows Store, iOS, and Android.
### Game Mechanics
![](CleanShot%202024-10-25%20at%2023.33.18@2x.png)
* **Core Gameplay**: *Asteroids - cosmic bounty* involves navigating a spaceship to avoid or shoot at obstacles and enemies. Players will shoot at rocks to reduce their size or eliminate them, and they will shoot at enemies to avoid being shot at. Players strive to survive and increase their high score.
* **Controls**: the ship is controlled via arrow keys to navigate around enemies or asteroids. The  `space` key allows players to shoot bullet projectiles at rocks and enemies. The key `p` allows users to pause the game during gameplay. In future updates, key mapping will be possible for accessibility as it is important for some players (especially the old ones in our target audience of arcade enthusiasts).
* **Player Progression**: by eliminating asteroids while avoiding the enemy player, the player will level-up. Players can collect powers for immediate, temporary use and score points by eliminating three enemies per level while leveling up after destroying all asteroids in the given level. The goal is to earn the highest score in comparison to other players.
	* In a future iteration, the player must race against the clock. Completing a level early will provide them with additional points.
	* In another future iteration, player can collect power-ups for immediate, temporary use to become invincible or increase their rate of fire. 
* **Challenges and Obstacles**: the player must score points without being hit by asteroids or the enemy, which can cause damage to the player’s shields at a rate faster than they regenerate.
### Story

* **Plot**: far off in a galaxy a long long ways away, there exists a notorious outlaw named dubbed *the aestrosoldier*. He has unleashed chaos in the astroid belt of the Lumen Sector. Fleeing from the federation, he uses the rocky debris and his crew on armed shuttlecraft to make a fortune from the gold he collects. Amidst his turmoil, a team of bounty hunters board the Starlight Cruiser in pursuit of credits. *The Rock* and  _Spike_,  pursue the aestrosoldier in a race against time and dodge incoming asteroids and confront his hostile crew. Will the Starlight Cruiser manage to bring the aestrosoldier justice? OR - will they just become another casualty in the astroid-ridden depths of space like other bounty hunters?
* **Characters**: 
	* *The Rock*: is the leader of this ship.
	* *Spike*: a reckless pilot hungry for food, but oftentimes damages the ship before he’s able to eat his steak.
	* *Aestrosolider*: hidden on an astroid, he sends his crew on the broken shuttlecraft he manages to repair and fight those attempting to capture him.
* **Backstory and Lore**: though the game does not feature players, the lore behind the game encourages players to search for the astroid with the true aestrosoldier. Will they find him, or is he only a myth?
	* Currently, he’s only a myth, but in a future update the player will find him stranded on an astroid in Level 10 sending what’s left of his crew and ships to flee the bounty hunters.

### Art and Aesthetics

#### Visual Style
The visual style plays homage to the classic space-shooter Aestroids, but with a bounty-hunter theme. The game uses a vibrant color palette, featuring deep blues and greens of bullets, a rusty-looking player ship, and small yet scary enemy ships. The combination of the retro style of Aestroids combined with a *Cowboy-Bebop* looking spaceship and bounty hunters provides players with a casual yet novel feel. Fast facts:
* 16-bit graphics are used.
* Pixel art is used with compressed bitmaps, but it tries to mimic vector graphics. 


#### Character Design
![](CleanShot%202024-10-25%20at%2023.35.33@2x.png)
Characters are not portrayed in Space Bounties, but rather described in the lore within planned advertising for the game. The design for the bounty hunting crew (The Rock & Spike) allows players to connect with them to fight the enemy in hiding. 
- **The Rock**. In lore, literature, and advertising, he will depicted as a daring leader wearing a rugged suit with dark, manly patterns that reflect the nature that he’s here for serious business. He’s is larger than Spike and carries a machine-laster and a bazooka.
- **Spike**, the pilot, has a sleek, tactical outfit with a space-blaster and provides a sharp contrast to The Rock’s serious design. He’s reckless and flys the ship as such. 
- **Aestrosoldier**, the rich, entrepreneurial tech expert appears seemingly unknown yet sports a high-tech jumpsuit complete with glowing interfaces and data pads, emphasizing his connection to technology and intelligence. He uses the pads to deploy decoys and ships to fight against anyone coming after him. 

Together, the characters create dynamic cast appealing to both serious and casual arcade gamers. In future software updates, the cast will be presented to players upon surviving ten rounds when the player achieves a *victory* against the aestrosoldier himself in an epic boss-battle, but until then, the man, the myth, and the legend will only exist in advertising and lore. 


#### Environment Design
![](CleanShot%202024-10-25%20at%2023.36.43@2x.png)
The environment of **Asteroids: Cosmic Bounty** provides the player with a stressful environment suitable only for the finest of bounty hunters. Both real and artificially created asteroids have the same shape, size, and texture to confuse the bounty hunters. In level ten, one particular astroid will break apart differently, revealing a hidden base full of energy, engineering, and crime. 

When the players shoot a common astroid, it will break apart creating a more chaotic world. 

#### User Interface
The user interface is designed to be intuitive and visually cohesive with the game’s simple aesthetic. The HUD shows the lives remaining and the score. A concept is provided below:

![](CleanShot%202024-10-25%20at%2023.09.18@2x.png)

The start menu and pause screens incorporate stylized, retro-inspired typography that reflects the game’s cosmic theme. Buttons look basic and old which fit the retro style. 


### Sound and Music

#### Sound Effects
The sfx  in **Asteroids: Cosmic Bounty** play a role in enhancing the game's immersive experience. The guns produce sound effects to confirm players are firing and warn players that bullets may be incoming. The explosive shattering of asteroids and ships stress players and creates tension while navigating the astroid field. 

#### Background Music
The background vacuum of space contains no audio to provide realism for the player and reminds them of the vast, emptiness that exists within space. Due to user complaints in a sample run, in a future update, ambient music will replace the silent background with added stress and intensity as the level progresses similar to music in *Cowboy Bebop* if the test-audience considers the music to provide a better experience

#### Voice Acting
While dialogue in **Asteroids: Cosmic Bounty** remains minimal, voice acting adds depth to critical moments. Each character has as a distinct voice that captures their personality traits, such as the rock yelling *”careful spike”* and Spike’s reckless retaliation of: *I know what I’m doing*. In-game dialogue snippets occur during key interactions, such as nearly missing an astroid or destroying an enemy ship. 

*Note - voice acting is not implemented yet, but will be in a future update (or if time permits).

#### Audio Integration
Sound in the game is integrated to respond to in-game events seamlessly. For instance, the above sound effect of *Careful Spike* will occur when the bounty-hunting ship is within five pixels of an astroid and is triggered using a secondary collision sphere sized a bit larger than the actual ship. This allows the developers to re-use methods such as overlapping of 2D objects. 

In a future update/add-on, the music will increase in intensity with each corresponding level and certain sound effects are only played during certain levels to reduce fatigue and repetition.

### World and Level Design

#### Level Structure
The level structure in **Asteroids: Cosmic Bounty**  is linear. As the player completes each level by destroying all remaining asteroids, a cut scene will commence chasing an enemy ship into the next astroid belt where a new, more complicated scene commences. 

This occurs up until level ten, when an enemy ship retreats back to the astroid belt where the Aestrosoldier resides and he sends his remaining fleet to battle the bounty hunters. 

While the game is mostly linear, future considerations will allow players to fail and start at a nearby base upon rescue for their credits which will decrease the store. 

#### Pacing and Difficulty
Difficulty scales gradually across levels. Early levels introduce players to basic movement and shooting mechanics in less crowded environments, while later levels increase the number of asteroids in the level and allow for multiple enemy ships to exist in the same scene. Level nine features multiple ships and a moving background with asteroids moving in the same direction to simulate a chase to the final astroid belt in level ten. 

#### Environment Interaction
The game features interactive environments where players can collide with asteroids, destroying them to clear paths or uncover hidden pickups within the debree.

#### Exploration and Secrets
The game will have secret power-ups hidden within asteroids that the character must pickup within a certain amount of time. Powerups include faster firing rates and invincibility shields lasting a few seconds from pickup. This may aid the player in navigating a tight astroid field, providing them with a few seconds of rest following the most intense moments. It also incentivizes them to fly and take great risks that resemble Spike’s characterure. 


### Technical Specifications

#### Game Engine
**Asteroids: Cosmic Bounty** is built on the Godot engine, generally allowing for robust performance. It is slightly less stable than paid platforms, but offers a superior, donation-based pricing model. Approximately 1% of game profits will be donated to the Godot Project (upon profitability).

The engine allows for rapid deployment across the aforementioned platforms. 

#### Platform Support
The game supports a range of platforms including most modern computers running Windows, MacOS, and Linux, enabling a broad audience to enjoy the adventure across multiple gaming environments.

#### Performance Targets
Maintaining a smooth player experience is a priority, with performance targets set at 60FPS. Due to the low-resource-intensity graphics, players should be able to dive into the game regardless of their platform. 


#### Physics Systems
![](CleanShot%202024-10-25%20at%2023.32.23@2x.png)
The physics system uses a robust, built-in Godot tool. A rigidbody is applied to the rocks and players to provide believable movement in space.  The low angular and linear damping creates a less controllable ship providing the user with a challenge. Gravity is turned off for all objects.

Enemy NPC ships do not contain a rigid bodies to avoid collisions with rocks and their affects, but in future updates, enemy ships will be placed on a different masking player. 

### Future Updates
To avoid misleading the customer, the aforementioned future updates will be prioritized and completed before an official release. A pre-release will be provided, but not monetized so feedback can be gathered without disappointing potential customers for spending money on a seemingly incomplete product. 
