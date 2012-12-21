# Maintainer: taylorchu <tailinchu [at] gmail [dot] com>

pkgname=zippy
pkgver=2012
pkgrel=1
pkgdesc='python terminal archiver'
arch=('any')
url='https://github.com/taylorchu/zippy'
license=('GPL2')
depends=('python2')
makedepends=('git')
_gitroot="https://github.com/taylorchu/zippy"
_gitname="zippy"
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
 make DESTDIR="$pkgdir" install
}
