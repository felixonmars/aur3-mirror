# Contributor: kaivalagi <m_buck@hotmail.com>

pkgname=conkygooglecalendar
pkgver=2.16
pkgrel=1
pkgdesc="Provides Google calendar info, for use in Conky."
arch=('i686' 'x86_64')
url="https://launchpad.net/~conky-companions"
license=('GPL3')
depends=('python2' 'python2-gdata' 'python2-keyring' 'python2-dateutil')
makedepends=()
install=$pkgname.install
source=("https://launchpad.net/~conky-companions/+archive/ppa/+files/${pkgname}_${pkgver}.tar.gz")
md5sums=('f891e0cedec5f5b80fc236c0be6c5506')

build() {
  cd $srcdir/src
  python2 setup.py build
}

package() {
  cd $srcdir/src
  python2 setup.py install --root=$pkgdir
  install -Dm644 README $pkgdir/usr/share/conkygooglecalendar/README
}

