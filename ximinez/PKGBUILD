# Maintainer: TDY <tdy@gmx.com>
# Maintainer: Fernando Henrique <arch at liquuid dot net> 

pkgname=ximinez
pkgver=0.8_20090323110443
pkgrel=1
pkgdesc="A disk usage analyzer and comparator"
arch=('i686' 'x86_64')
url="http://ximinez.sourceforge.net/"
license=('BSD')
depends=('python-paramiko' 'wxpython')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-src-${pkgver/_/-}.tar.gz)
md5sums=('68cbd2b4b5815a696b96009263ebc3ec')

build() {
  cd "$srcdir/$pkgname-src-${pkgver/_/-}"
  make DESTDIR="$pkgdir" install || return 1
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 ${pkgname}cli.1 "$pkgdir/usr/share/man/man1/${pkgname}cli.1"
  install -Dm644 doc/License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
