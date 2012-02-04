pkgname=invautoupdate
pkgver=1.0.1
pkgrel=1
pkgdesc="Helper script which updates a local invertika server."
url="http://wiki.invertika.org/Autoupdate"
arch=("i686")
license=('GPL')
depends=('adler32')
optdepends=('invertika-server')
backup=('etc/invautoupdate.conf')
source=($pkgname-$pkgver.tar.gz)
md5sums=('2126437dd2e6e11ab7786d51943c592a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin $pkgdir/etc
  install ./invautoupdate $pkgdir/usr/bin/
  install -m 644 ./invautoupdate.conf $pkgdir/etc/
}
