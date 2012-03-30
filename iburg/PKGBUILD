# Maintainer: schuay <jakob.gruber@gmail.com>

pkgname=iburg
pkgver=20070121
pkgrel=1
pkgdesc="A tree parser generator"
arch=('x86_64' 'i686')
url="http://code.google.com/p/iburg/"
license=('custom')
source=("http://iburg.googlecode.com/files/iburg.tar.gz")
md5sums=('b487e57a00af45d43a6994acc40016b3')

build() {
  cd $srcdir

  make
}

package() {
  cd $srcdir

  install -Dm755 iburg $pkgdir/usr/bin/iburg
  install -Dm644 iburg.1 $pkgdir/usr/share/man/man1/iburg.1
  install -Dm644 COPYRIGHT $pkgdir/usr/share/licenses/iburg/LICENSE
}

# vim:set ts=2 sw=2 et:
