# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Dylon Edwards <deltaecho@archlinux.us>

pkgname=ktw
pkgver=0.1.0
pkgrel=1
pkgdesc="A KDE front-end for 'Translate Word'"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/twandgtw/"
license=('GPL')
depends=('hicolor-icon-theme' 'tw' 'kdelibs>=4.0')
makedepends=('cmake' 'automoc4')
source=(http://download.savannah.gnu.org/releases/twandgtw/ktw-$pkgver.tar.bz2)
md5sums=('f3cd3d68b3a324b9c8e1c91cbdab52d9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
