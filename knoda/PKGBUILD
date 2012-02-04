# Maintainer: Nickolay Orekhov <nowhere@mail.ru>

pkgname=knoda
pkgver=0.8.3
pkgrel=1
pkgdesc="Knoda: Database frontend for KDE like Microsoft Access"
arch=('i686')
url="http://www.knoda.org/"
license=('GPL')
makedepends=('hk_classes' 'kdelibs3')
depends=('hk_classes' 'kdelibs3' 'kdebase-runtime')
source=(http://downloads.sourceforge.net/project/knoda/knoda/$pkgver/knoda-$pkgver.tar.gz)
md5sums=('33e55f07168df94ace090d0bcecd7555')
conflicts=('knoda')
provides=('knoda')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --without-arts
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
