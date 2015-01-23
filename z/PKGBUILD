# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=z
pkgver=2.6.1
pkgrel=1
pkgdesc="A simple, safe, and convenient front-end for various [un]compression tools"
arch=('any')
url="http://www.cs.indiana.edu/~kinzler/z/"
license=('GPL')
depends=('sh')
optdepends=('unzip: extract zip archives'
            'zip: create zip archives')
source=(http://www.cs.indiana.edu/~kinzler/z/z-$pkgver.tgz)
md5sums=('3ce878079a7a0d204f97c903a8cc4530')

package() {
  cd "$srcdir/z-$pkgver"
  install -Dm755 z "$pkgdir/usr/bin/z"
  install -Dm644 z.man "$pkgdir/usr/share/man/man1/z.1"
}

# vim:set ts=2 sw=2 et:
