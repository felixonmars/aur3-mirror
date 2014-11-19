# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>

pkgname=pulseview-git
_pkgname=pulseview
pkgver=854.e2f90c5
pkgrel=1
pkgdesc="A Qt based logic analyzer GUI for sigrok. (git version)"
arch=('i686' 'x86_64')
url="http://sigrok.org/wiki/Main_Page"
license=('GPL3')
depends=('libsigrok-git' 'libsigrokdecode-git' 'qt5-base' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
provides=('pulseview')
conflicts=('pulseview')
source=("git://sigrok.org/$_pkgname"
        'pulseview.desktop')
md5sums=('SKIP'
         'f816b4aff1ddf5683d5df94e69576ec7')
install=${_pkgname}.install

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_pkgname"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 ../pulseview.desktop "$pkgdir/usr/share/applications/pulseview.desktop"
}

# vim:set ts=2 sw=2 et:
