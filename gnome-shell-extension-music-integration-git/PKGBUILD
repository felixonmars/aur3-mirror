# Maintainer: Nicoco <truenicoco_AT_gmail.com>
pkgname=gnome-shell-extension-music-integration-git
pkgver=20120109
pkgrel=3
pkgdesc="Integrate your music into Gnome Shell automatically. "
arch=('any')
url="https://extensions.gnome.org/extension/30/music-integration/"
license=('GPL' 'LGPL')
depends=('gnome-shell-extensions-common' 'python-gobject')
makedepends=('git' 'gnome-common' 'intltool')

install='gschemas.install'

_gitroot="git://github.com/brianrobles204/Music-Integration.git"
_gitname="Music-Integration"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
	else
		git clone $_gitroot --depth=1
		cd $_gitname
	fi
	msg "The local files are updated."
	msg "Starting make..."
	./autogen.sh
	./configure --prefix=/usr
	make
	
	mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions
}
package() {
	cd ${srcdir}/${_gitname}
    make DESTDIR="$pkgdir" install
}
