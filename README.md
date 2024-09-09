# FBLA Game 2024
###### *title very WIP*
This is a game for FBLA's Video Game Challenge Presentation Event.
## Installation
###### *guide WIP*
### Prerequisites
#### Install Godot
1. Download Godot at [https://godotengine.org/download/](https://godotengine.org/download/)
2. Extract the .zip somewhere on your PC (ie: `C:\\Users\(Your Name)\Documents\Godot`)
#### Install Git
1. Download Git at [https://git-scm.com/download/win](https://git-scm.com/download/win)
2. Run the .exe and go through the setup wizard
3. Open the terminal (on windows: press the windows key then type in "terminal")
4. Configure your username and email with the following commands:
```shell
$ git config --global user.name "your name"
$ git config --global user.email your@email.com
```
#### Setup a PAT
1. In Github, click on your account icon and click on settings.
2. Scroll down to Developer Settings and click on it.
3. Open the Personal access tokens dropdown and select "Fine-grained tokens"
4. Click "Generate new token"
5. Name your token and set the expiration date
6. Under "Repository access" select "Only select repositories", then select "fbla-game-2024" (if i've given you push access)
7. Under "Repository Permissions" set "Contents" to "Read and Write"
8. Click "Generate Token"
9. Copy the token to somewhere safe
### Project Setup
1. Download the project at [https://github.com/bf-bonkus/fbla-game-2024/archive/refs/heads/master.zip](https://github.com/bf-bonkus/fbla-game-2024/archive/refs/heads/master.zip)
2. Extract the .zip somewhere on your PC (ie: `C:\\Users\(Your Name)\Documents\Godot\Projects)`)
3. Launch Godot (I'd recommend pinning it to the taskbar)
4. Select Import
5. Go to where you extracted the project .zip
6. Click "Open"
### Godot-Git Setup
1. In Godot, go to Project -> Version Control -> Version Control Settings
2. In the "username" field, paste in your git username
3. In the "password" field, paste in your PAT
4. Select HTTPS
5. Enable VCS
6. Click close
7. UNFINISHED
