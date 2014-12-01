# Maintainer: TDY <tdy@gmx.com>

pkgname=logtailer
pkgver=6
pkgrel=1
pkgdesc="A small command-line utility for monitoring log files in real time"
arch=('i686' 'x86_64')
url="http://offog.org/code/"
license=('GPL')
source=(http://offog.org/files/$pkgname-$pkgver.tar.gz)
sha256sums=('0c4c8f7df93fa8890b1f072e1d05fffc1e0cc1fc23b1fba33b4df7788ce4f924')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
