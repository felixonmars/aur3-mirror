# Maintainer: Andrew Fuller <qartis@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=sloth
pkgver=1.0.1
pkgrel=1
pkgdesc="Slow down a specified process by any delay (in milliseconds)"
arch=(i686 x86_64)
license=('GPL2')
source=(http://qartis.com/cache/$pkgname-$pkgver.tar.gz)
md5sums=('fa50a6ec999d5861e705dfb8bd212f0f')
url="http://communityprojects.org/apps/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
