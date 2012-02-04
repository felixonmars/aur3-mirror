# Contributor: Imanol Celaya <ilcra1989@gmail.com>
pkgname=lexi
pkgver=1.3
pkgrel=2
pkgdesc="Lexi is a simple lexical analyser generator."
arch=('i686' 'x86_64')
url="http://www.tendra.org/wiki/Lexi"
license=('custom')
makedepends=(bmake dia)
source=(http://www.tendra.org/releases/lexi/lexi-1.3.tar.gz
        LICENSE)
md5sums=('680e64407a2c3791e66dd47d2a657602'
         '71633dfbc9f2c904a1daefd3eaa241a2')

build() {
  cd $srcdir/$pkgname-$pkgver
  PREFIX=$pkgdir/usr bmake install || return 1
  install -D -m644 $startdir/LICENSE $pkgdir/usr/share/licenses/lexi/LICENSE
}

# vim:set ts=2 sw=2 et:
