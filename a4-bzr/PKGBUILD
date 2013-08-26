# Contributor: Košava <kosava@archlinux.us>

_pkgname=a4
pkgname=a4-bzr
pkgver=114
pkgrel=1
pkgdesc="A4 is an editor and viewer of presentations."
arch=('i686' 'x86_64')
url="https://launchpad.net/a4"
license=('GPL3')
depends=('pygtk' 'python2-rsvg' 'python2-lxml' 'python2-numpy')
makedepends=('bzr')
conflicts=('a4')
provides=('a4')
source=("$_pkgname::bzr+https://code.launchpad.net/a4/trunk")
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  bzr revno
}

package() {
    cd $_pkgname
    python2 setup.py install --prefix=/usr --root=$pkgdir 
}