# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=python2-pyinputevent
_pkgname=pyinputevent
pkgver=0.1c
pkgrel=1
pkgdesc="Python interface to the Input Subsystem's input_event and uinput"
arch=('any')
url="https://github.com/rmt/pyinputevent"
license=('GPL')
depends=('python2' )
makedepends=()
checkdepends=()
install=
changelog=
source=(https://projects.russo79.com/attachments/download/75/$_pkgname-$pkgver.tar.gz)
md5sums=('177af1c1c8d241618ef54b6b12cc3d2d') 

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i 's/env python/env python2/' setup.py
  sed -i 's/env python/env python2/' pyinputevent/pyinputevent.py
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
