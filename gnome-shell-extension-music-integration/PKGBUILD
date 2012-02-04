# Maintainer: Dongfengweixiao <dongfengweixiao@gmail.com>
pkgname=gnome-shell-extension-music-integration
pkgver=20111209
pkgrel=1
pkgdesc="Integrate your music into Gnome Shell automatically. Turn on more settings by reading the instructions on the extension homepage. "
arch=('i686' 'x86_64')
url="https://extensions.gnome.org/extension/30/music-integration/"
license=('GPL' 'LGPL')
depends=('gnome-shell-extensions-common')
makedepends=('git' 'gnome-common' 'intltool')
_gitroot="git://github.com/brianrobles204/Music-Integration.git"
_gitname="Music-Integration"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot --depth=1
    
		cd $_gitname
		git branch -f gnome-3-0 origin/gnome-3-0
		git checkout gnome-3-0
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."
	mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions
}
package() {
	cd ${srcdir}/${_gitname}
	cp -rf music-integration@brianrobles204 ${pkgdir}/usr/share/gnome-shell/extensions
}
#This extension listens to Dbus MPRIS2 and automatically looks for players. It then adds an icon to the Gnome panel when it finds a music player and creates a nice notification when the song changes. You also have an option to integrate the player into the volume menu, much like in Ubuntu's setup. All these options are configurable through a nice GUI tool.
#Tested Players:
#    Banshee - with DBus Mpris plugin
#    Rhythmbox - with DBus Mpris plugin
#   Clementine
#   Guayadeque
#   Quodlibet - with DBus Mpris plugin
#   Google Music Frame / Nuvola
#Other Supported Players (may be untested or partially supported):
#    Amarok
#    Beatbox
#    DeaDBeeF
#    mpd
#    Pithos
#    Pragha
#    xbmc
#Note: Audacious is unsupported because it uses an obsolete version of MPRIS. Sorry...
