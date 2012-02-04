# Maintainer: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
pkgname=namcap-reports
pkgver=0.2.92
pkgrel=1
pkgdesc="Generates pretty HTML output from namcap logs."
arch=(any)
url="http://abhidg.mine.nu/arch/namcap-reports"
license=('custom')
depends=(python)
backup=('etc/namcap-reports.conf')
source=(http://cloud.github.com/downloads/abhidg/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('73c2384d433d7b1529d9e38f88a1133d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
