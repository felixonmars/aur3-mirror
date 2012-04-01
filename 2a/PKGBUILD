# Maintainer: taylorchu <tailinchu [at] gmail [dot] com>

pkgname=2a
pkgver=20120401
pkgrel=1
pkgdesc='2a ncurses archiver'
arch=('any')
url='https://github.com/taylorchu/2a'
license=('GPL2')
depends=('ncurses' 'libarchive')
makedepends=('git')
_gitroot="https://github.com/taylorchu/2a"
_gitname="2a"
build() {
   cd "$srcdir"
 msg "Connecting to GIT server...."
 if [ -d $_gitname ] ; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
 else
   git clone --depth=1 $_gitroot $_gitname
   cd $_gitname
 fi
 msg "GIT checkout done or server timeout"
 make
 make DESTDIR="$pkgdir" install
}
