anna boot DA MACHINE!?!

# .dotfiles

This is for my personal use. Feel free to use any of these scripts, but run them
at your own discretion. I am not responsible for any effects of these scripts
on your machine.

The directory structure was mostly modeled after [cowboy's dotfiles][cowboy].

- `bin/` commands to be included in the path for custom scripts. You need to
  make sure you run `chmod a+x "${DOTFILES}"/bin/*` whenever you add a new file
  to this directory in order to have the correct permissions to run it.

- `copy/` All files in here will be copied over to `~`. Use this for files that
  will carry sensitive information, such as git credentials, or for files that
  you may want to override on your given installation, but not override for all
  of your computers.

- `init/` All files in here will be run upon running `./bin/dotfiles setup`. Use
  this for things like installing homebrew or other applications that should
  only need to be run once.

- `link/` All files in here will be symlinked with `ln -s` to `~`. Use this for
  config dotfiles such as `.bash_profile`.

- `source/` All files in here will be included upon every new terminal session.
  Use this for things like aliases, functions, and customizing the bash prompt.

# Mac Installation

If you want to create a bootable installer for macOS, follow the instructions
[here][createinstallmedia].

```sh
# Change /Volumes/Untitled to the volume you want it to be
sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled --nointeraction
```

Then backup:

```sh
~/.dotfiles/bin/dotfiles backup ~/Desktop
# after it's done, move the backup/ folder to removable media
```

Then boot into the install media holding down option key, format the drive, and
install the OS.

As of macOS 10.14 (Mojave) you need to install XCode in it's fullest :(

Once in the OS open up the terminal:

```sh
# installs the command-line tools
xcode-select --install
git clone https://github.com/ksmithut/.dotfiles.git ~/.dotfiles
~/.dotfiles/bin/dotfiles setup
```

You need to manually move over your backup data.

# Ubuntu Installation

(For Dell XPS 15 9560)

Add `nouveau.modeset=0` to boot options (by pressing `e` when selecting a boot
option and adding it before the `---` being sure to leave an extra space)

After installation:

```sh
# configure required kernel parameter (https://github.com/Bumblebee-Project/bbswitch/issues/148)
sudo nano /etc/default/grub
# change this parameter to: GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_rev_override=1"
# Change grub background theme
# Login screen
# Make backup first before editing
sudo cp /etc/alternatives/gdm3.css /etc/alternatives/gdm3.css.backup
sudo nano /etc/alternatives/gdm3.css
# ^ Look for #lockDialogGroup and change color to #191919
# Grub Screen
sudo cp /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.grub /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.grub.backup
sudo cp /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.script /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.script.backup
sudo nano /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.grub
# ^ Change rgb color to 25,25,25,0
sudo nano /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.script
# ^ Look for Window.SetBackgroundTopColor and change the color to (0.10, 0.10, 0.10)
# rebuild the bootloader
sudo update-grub2

sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update

# Keyboard shortcuts
# ==================
# Prevent gnome resetting keyboard setting in X
gsettings set org.gnome.settings-daemon.plugins.keyboard active false

# change workspace movement to ctrl + <- and ctrl + ->
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control>Left']"
# Undo gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control>Right']"
# Undo gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Alt>Right']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Control>Up']"
# Undo gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Control>Down']"
# Undo gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Alt>Down']"

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Control><Shift>Left']"
# Undo gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Control><Shift>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Control><Shift>Right']"
# Undo gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Control><Shift>Right']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Control><Shift>Up']"
# Undo gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Control><Shift>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Control><Shift>Down']"
# Undo gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Control><Shift>Down']"


# swap super and alt
# setxkbmap -option altwin:swap_lalt_lwin # TODO make this permanent
# Undo setxkbmap -option
```

- [https://github.com/rcasero/doc/wiki/Ubuntu-linux-on-Dell-XPS-15-(9560)](<https://github.com/rcasero/doc/wiki/Ubuntu-linux-on-Dell-XPS-15-(9560)>)
- [https://gist.github.com/tomwwright/f88e2ddb344cf99f299935e1312da880](https://gist.github.com/tomwwright/f88e2ddb344cf99f299935e1312da880)

```
sudo apt update -y
sudo apt upgrade -y
sudo apt install git -y
git clone https://github.com/ksmithut/.dotfiles.git ~/.dotfiles
~/.dotfiles/bin/dotfiles setup
```

```sh
# Fix firefox theming
# Open up about:config
# add new string key: 'widget.content.gtk-theme-override' with value 'Adwaita:light'
# change 'layout.css.devPixelsPerPx' to 1.25 for global scaling
```

# Pixelbook

Open up "Settings" again and scroll down until you reach "Linux Apps", and
enable that. It will take a bit to download the image.

Once your in, you'll need to change the password of the root user:

```sh
sudo passwd ${USER}
```

Next, you'll want to make sure your ssh keys are all setup. Make sure your ssh
keys are in place at `~/.ssh`, then run:

```sh
eval $(ssh-agent -s)
# adds all of the private keys to the agent
ssh-add ~/.ssh/id_rsa # Or whatever other keys you need to add
```

After that, clone this repo and run the setup script described above.

```sh
git clone https://github.com/ksmithut/.dotfiles.git ~/.dotfiles
~/.dotfiles/bin/dotfiles setup
```

I also like to change the terminal configuration to work with powerline fonts:

1. When in the terminal, press `ctrl + shift + p`
2. Change `font-family` to `"Source Code Pro", monospace`
3. Change `user-css` to `https://cdn.rawgit.com/wernight/powerline-web-fonts/e4d967ca4f95d9fa0cf1d51afed2e5a5927d759e/PowerlineFonts.css`

# Windows

Obviously, this is meant for mac/linux based on the bash usage, but I'd like to
have some scripts ready to setup my gaming machines as well. Unfortunately, I've
failed to find a package manager that has the things I want to install
(mostly gaming software since I don't do any development on windows).

Here's my list of apps and the locations to download them manually:

- [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- [1Password](https://1password.com/downloads/)
- [Discord](https://discordapp.com/download)
- [Uplay](https://uplay.ubi.com/)
- [Steam](https://store.steampowered.com/)
- [Battle.net](https://us.battle.net/account/download/)
- [Origin](https://www.origin.com/usa/en-us/store/download)
- [GeForce Experience](https://www.nvidia.com/en-us/geforce/geforce-experience/)
- [Minecraft](https://minecraft.net/en-us/download/)

Also, in order to play with with time, Windows should be made to use UTC rather
than local time.

[https://askubuntu.com/questions/169376/clock-time-is-off-on-dual-boot#169384](https://askubuntu.com/questions/169376/clock-time-is-off-on-dual-boot#169384)

> Create a file named WindowsTimeFixUTC.reg with the following contents and then double click on it to merge the contents with the registry:
>
>     Windows Registry Editor Version 5.00
>     [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation]
>          "RealTimeIsUniversal"=dword:00000001
>
> Note: Windows Time service will still write local time to the RTC regardless of the registry setting above on shutdown, so it is handy to disable Windows Time service with this command (if time sync is still required while in Windows use any third-party time sync solution):
>
>     sc config w32time start= disabled

# Backup

Before you begin a clean install, you may wish to backup other non-dotfile
related files (such as pictures and documents and such). There is a backup
script to help facilitate that in `~/.dotfiles/bin/dotfiles`. Open that
file and look at the line that looks like this:

```sh
copy_dirs=(
  ~/Code
  ~/Pictures
)
```

Add or remove paths in that group as you wish. To run the back up, just `cd`
into the .dotfiles directory and run `~/.dotfiles/bin/dotfiles backup [backup directory]`.

[cowboy]: https://github.com/cowboy/dotfiles
[createinstallmedia]: https://support.apple.com/en-us/HT201372
