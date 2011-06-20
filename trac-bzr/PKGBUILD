pkgname=trac-bzr
pkgver=50
pkgrel=2
pkgdesc="Bazaar implementation for Trac"
arch=("i686" "x86_64")
url="https://launchpad.net/trac-bzr"
license=("GPL2" "GPL3")
depends=("python2" "trac")
makedepends=("bzr")
install=$pkgname.install

_bzrbranch=lp:trac-bzr
_bzrmod=trac-bzr

build() {
  cd $srcdir

  bzr get $_bzrbranch $_bzrmod -q -r $pkgver

  cd $_bzrmod
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
}
