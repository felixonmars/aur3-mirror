# Maintainer: TDY <tdy@gmx.com>

pkgname=sx-simpledeco
pkgver=0.1
pkgrel=1
pkgdesc="A basic, cairo-independent window decorator plugin for samurai-x"
arch=('i686' 'x86_64')
url="http://samurai-x.org/"
license=('BSD')
depends=('python>=2.5')
makedepends=('setuptools')
source=(http://samurai-x.org/downloads/$pkgname-$pkgver.tar.gz LICENSE)
md5sums=('aa0d394e831bf89e4f1fc4c7ea80de93'
         '3970f82a1b5a32142fd4c42c006da75d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
