pkgname=libnss-mysql
pkgver=1.5
pkgrel=2
pkgdesc="Store your UNIX user accounts in MySQL"
arch=('i686' 'x86_64')
backup=(etc/libnss-mysql-root.cfg etc/libnss-mysql.cfg)
url="http://libnss-mysql.sourceforge.net/"
license=("GPL")
depends=('mysql>=5.0.15')
source=(http://sourceforge.net/projects/libnss-mysql/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('a34d41a38e426ba26ffde07d03beef8e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/etc"
  make DESTDIR="$pkgdir" install
}
