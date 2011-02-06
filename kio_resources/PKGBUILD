# Contributor: Mladen Pejaković <pejakm@gmail.com>

pkgname=kio_resources
pkgver=0.2
pkgrel=0
pkgdesc="A KDE resources kioslave"
url="http://kde-apps.org/content/show.php?content=26521"
depends=('kdebase')
source=(http://kde-apps.org/CONTENT/content-files/26521-$pkgname-$pkgver.tar.bz2)
md5sums=('63f99f1fe2c5974073e7a7a3538e2dd2')
arch=(i686)
license="GPL"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install
}
