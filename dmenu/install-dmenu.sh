#!/bin/sh
# sudo rm -r dmenu-4.9.5.tar.gz dmenu-git-4.9.5-1-x86_64.pkg.tar.gz src pkg ; tar -czvf dmenu-4.9.5.tar.gz configs-dmenu && makepkg && sudo pacman -U dmenu-git-4.9.5-1-x86_64.pkg.tar.gz && sudo rm dmenu-git-4.9.5-1-x86_64.pkg.tar.gz dmenu-4.9.5.tar.gz src pkg -r ; echo "installed/updated"
pkgname=dmenu
pkgver=4.9.5

if [ -f $pkgname-$pkgver-1-x86_64.pkg.tar.xz ]; then
	sudo rm $pkgname-$pkgver-1-x86_64.pkg.tar.xz
fi
if [ -f $pkgname-$pkgver.tar.gz ]; then
	sudo rm $pkgname-$pkgver.tar.gz;
fi
if [ -d pkg ]; then
	sudo rm -r pkg;
fi
if [ -d src ]; then
	sudo rm -r src
fi

# if [ ! -d configs-$gitname ]; then
# 	if [ -d $gitname ]; then
# 		mv $gitname configs-$gitname
# 		break
# 	fi

# 	if [ ! -d $gitname ] && [ ! -d configs-$gitname ]; then
# 	    git clone https://git.suckless.org/dwm
#     fi

# 	if [ -d $gitname ]; then
# 	 	mv $gitname configs-$gitname
# 	else
# 		echo ""
# 		echo ""
# 		echo "we failed to download dwm"
# 		echo "pleas download dwm by => git clone https://git.suckless.org/dwm"
#         echo "and paste it on this folder (dwm folder)"
# 		exit 1
# 	fi
# fi

tar -czvf $pkgname-$pkgver.tar.gz configs-$pkgname

if [ -f $pkgname-$pkgver.tar.gz ]; then
	makepkg --skipchecksum;

	if [[ -f $pkgname-$pkgver-1-x86_64.pkg.tar.xz ]]; then
		sudo pacman -U $pkgname-$pkgver-1-x86_64.pkg.tar.xz && sudo rm $pkgname-$pkgver-1-x86_64.pkg.tar.xz $pkgname-$pkgver.tar.gz src pkg -r;
		echo installed/updated;
	fi
fi
