# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=gsfv
pkgver=0.2.1
pkgrel=2
pkgdesc="A graphical interface written in GTK+ for manipulating .sfv (Simple File Verification) files."
arch=(i686)
url="http://www.localhost.nu/apps/gsfv/"
license=('GPL')
depends=('gtk>=1.2.0')
source=(http://www.localhost.nu/apps/gsfv/$pkgname-$pkgver.tar.gz)
md5sums=('0864ae323e40511d656c4f9ee80343e6')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
