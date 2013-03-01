# Maintainer: Daniel Rivas <dev.daniel.e.rivas.sz@gmail.com>

pkgname=sleutelb
pkgver=20130301
pkgrel=3
pkgdesc="A fancy way to handle key events in standalone window managers"
arch=('i686' 'x86_64')
url="https://github.com/DanielRS/Sleutelb"
license=('GPL')
depends=(
	'bash' 'libx11' 'libnotify' 'glib2' 'xf86-input-synaptics'
)
makedepends=(
	'git' 'pkg-config'
)
optdepends=(
	'notification-daemon: GNOME notification daemon'
	'xfce4-notifyd: XFCE 4 notification daemon'
	'notify-osd: Ubuntus notification daemon'
)

_gitroot="https://github.com/DanielRS/Sleutelb.git"
_gitname="Sleutelb"

build() {
	cd $srcdir
	
	msg "Connecting to github GIT server..."
	
	if [ -d "$srcdir/$_gitname" ]; then
		cd $_gitname && git pull origin
	else
		git clone $_gitroot
		cd $_gitname
	fi
	
	msg "Compiling package..."
	gcc -o sleutelb sleutelb.c `pkg-config --cflags --libs glib-2.0 gtk+-2.0` -lX11 -lnotify
	msg "Done!"
	mkdir -p "$pkgdir/usr/bin"
	install -m 755 sleutelb "$pkgdir/usr/bin/sleutelb"
}
