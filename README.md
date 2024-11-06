# BREADIQUETTE
This is a game for FBLA's Video Game Challenge Presentation Event.
## Installation
### Prerequisites
#### Install Godot
1. Download Godot at [https://godotengine.org/download/](https://godotengine.org/download/)
2. Extract the .zip somewhere on your PC (ie: `C:\Users\(Your Name)\Documents\Godot`)
#### Install Git
1. Download Git at [https://git-scm.com/download/win](https://git-scm.com/download/win)
2. Run the .exe and go through the setup wizard
3. Open the terminal (on windows: press the windows key then type in "terminal")
4. Configure your username and email with the following commands:
```shell
git config --global user.name "your name"
```
```shell
git config --global user.email your@email.com
```
#### Setup a PAT
1. In Github, click on your account icon and click on settings.
2. Scroll down to Developer Settings and click on it.
3. Go to Personal access tokens -> Fine-grained tokens
4. Click "Generate new token"
5. Name your token and set the expiration date
6. Under "Repository access" select "Only select repositories", then select "fbla-game-2024" (if i've given you push access. If it isn't an option, fork the repo)
7. Under "Repository Permissions" set "Contents" to "Read and Write"
8. Click "Generate Token"
9. Copy the token to somewhere safe
### Project Setup
1. Reopen the terminal (assuming you closed it)
2. Go to the directory where you want to setup your project, using the cd command (ie: cd Documents/godot/projects)
3. Run the following command:
```shell
git clone https://github.com/bf-bonkus/fbla-game-2024.git
```
4. Open Godot and press Import
5. Go to where you downloaded the project and double click on project.godot
6. Press Import & Edit
### Godot-Git Setup
1. In Godot, go to Project -> Version Control -> Version Control Settings
2. In the "username" field, paste in your git username
3. In the "password" field, paste in your PAT (You have to do this step every time you start Godot, for safety reasons)
4. Enable "Connect to VCS"
5. Click apply
6. Widen the "Inspector" tab until "Commit" is visible
7. At this point, everything should work. I'd recommend using the pull button (should look like a downwards arrow) to double-check
8. If you can't press the button, errors pop up, or if the bottom doesn't have something that says "origin":
9. Click the three dots at the very bottom right and select "Create new Remote"
10. Name it something like `origin` and set the remote url to `https://github.com/bf-bonkus/fbla-game-2024.git`
11. Reboot Godot
12. If it still doesn't work, contact me.
