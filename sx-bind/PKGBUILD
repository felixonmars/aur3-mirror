# Maintainer: TDY <tdy@gmx.com>

pkgname=sx-bind
pkgver=0.1
pkgrel=1
pkgdesc="A keybinding plugin for samurai-x"
arch=('i686' 'x86_64')
url="http://samurai-x.org/"
license=('BSD')
depends=('sx-actions')
makedepends=('setuptools')
source=(http://samurai-x.org/downloads/$pkgname-$pkgver.tar.gz LICENSE)
md5sums=('52e4ea5ef508cdb7a30392cefc5bdfbb'
         '3970f82a1b5a32142fd4c42c006da75d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
