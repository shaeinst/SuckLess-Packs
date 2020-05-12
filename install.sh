isInstalled=$(pacman -Q | grep dwm | awk '{ print $1}')
if [ $isInstalled = 'dwm' ]; then
    echo 'dwm installed detected';
fi

#dwm installation section
echo 'dwm installing'
cd dwm && ./install-dwm.sh; cd -

#dmenu installation section
echo '\n\n\n\ndmenu installing'
cd dmenu && ./install-dmenu.sh; cd -


#dstatus installation section
echo '\n\n\n\n installing dwm status/infos'
sudo cp ./dstatus/* /usr/local/bin/

#some important dependency
isSlockInstalled=$(pacman -Q | grep slock | grep -m1 "" | awk '{ print $1}')
isPactlInstalled=$(pacman -Q | grep pulseaudio | grep -m1 "" | awk '{ print $1}')
isLightInstalled=$(pacman -Q | grep light | grep -m1 "" | awk '{ print $1}')
if [ ! $isSlockInstalled = 'slock' ]; then
    sudo pacman -S slock;
fi
if [ ! $isPactlInstalled = 'pulseaudio' ]; then
    sudo pacman -S pulseaudio;
fi
if [ ! $isLightInstalled = 'light' ]; then
    sudo pacman -S light
fi
