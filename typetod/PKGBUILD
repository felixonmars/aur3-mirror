# Maintainer: raviqqe <raviqqe@gmail.com>
pkgname=typetod
pkgver=0.02
pkgrel=4
pkgdesc="typing game to let you type anything forever"
arch=('any')
url="https://github.com/raviqqe/typetod"
license=('custom:UNLICENSE')
depends=('python' 'python-feedparser')
optdepends=('python-unidecode: better unicode-to-ascii transliteration '\
'support')
source=("https://github.com/raviqqe/$pkgname/"\
"raw/master/pkg/$pkgname-$pkgver.tar.gz")
md5sums=('9e85f2d1357186b76d9487e61da4e48f')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr MANPREFIX=/usr/share DESTDIR=$pkgdir install
  install -m 644 -D UNLICENSE $pkgdir/usr/share/licenses/$pkgname/UNLICENSE
}
