# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=siglar
pkgver=0.7.18.i386
pkgrel=1
pkgdesc="siglar automaticaly creates many suggestions for new acronyms using the initial letters of words or word parts in a phrase or name."
arch=('i686')
url="http://www.geocities.com/jfernandes.bitalley/"
license=("custom:freeware")
depends=('gtk2>=2.10')
source=(http://www.geocities.com/jfernandes.bitalley/$pkgname-$pkgver.tar.gz)
md5sums=('0ce95c88304680e751e76a0c70d648dc')
build() {
  cd $startdir/src/$pkgname-$pkgver
  cat install.sh | sed 's/\/opt\/ba/$startdir\/pkg\/opt\/ba/g'| sed 's/\/usr\/bin/$startdir\/pkg\/usr\/bin/g' > install_pkg.sh
  chmod u+x install_pkg.sh
  install -d $startdir/pkg/opt
  install -d $startdir/pkg/usr
  install -d $startdir/pkg/usr/bin
  . install_pkg.sh
  install -d -p $startdir/pkg/usr/share/licenses/siglar
  install license.txt $startdir/pkg/usr/share/licenses/siglar/
}
