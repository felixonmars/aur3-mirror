# Maintainer: Cédric Royer <cedroyer@gmail.com>
pkgname=gnome-connection-manager
pkgver=1.1.0
pkgrel=2
epoch=
pkgdesc=""
arch=('any')
url="http://www.kuthulu.com/gcm/?module=home&lang="
license=('GPL3')
groups=()
depends=('expect' 'pygtk>=2.22' 'python2' 'openssh')
makedepends=('pacman>=4.1')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("gnome-connection-manager_1.1.0_all.deb::http://www.kuthulu.com/gcm/gnome-connection-manager_1.1.0_all.deb"
        "$pkgname-$pkgver.patch")
noextract=()
md5sums=('526179efb284e8da7b66e058e61e9a68'
         '967a191ca673aec93546640002c794ab')
validpgpkeys=()

prepare() {
	mkdir "$srcdir/data"
	cd "$srcdir/data"
	tar xvzf "$srcdir/data.tar.gz"
	patch -i "$srcdir/$pkgname-$pkgver.patch" 'usr/share/gnome-connection-manager/gnome_connection_manager.py'
}

package() {
	cd "$srcdir"
	cp -r data/* $pkgdir
}
