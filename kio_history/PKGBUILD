# Contributor: Mladen Pejaković <pejakm@gmail.com>

pkgname=kio_history
pkgver=0.1
pkgrel=0
pkgdesc="A KDE history kioslave"
url="http://kde-apps.org/content/show.php?content=48274"
depends=('kdebase')
source=(http://kde-apps.org/CONTENT/content-files/48274-$pkgname-$pkgver.tar.bz2)
md5sums=('9967529d0e628ed57ed348920faf5ea2')
arch=(i686)
license="GPL"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install
}
