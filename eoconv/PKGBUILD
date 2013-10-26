# Maintainer: Michal Lisowski <lisu at riseup dot net>
pkgname=eoconv
pkgver=1.4
pkgrel=1
pkgdesc="Convert text files to and from various Esperanto text encodings, including Unicode, ISO-8859-3, HTML, and various ASCII notations"
arch=('any')
url="http://en.nothingisreal.com/wiki/Eoconv"
license=('GPL')
depends=('perl')
source=(http://files.nothingisreal.com/software/eoconv/$pkgname-$pkgver.tar.bz2)
md5sums=('c81cfb10aaa215631bde46ed3fe1f319')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/man/man1
  install -m 0755 eoconv.pl $pkgdir/usr/bin/eoconv || return 1
  install -m 0644 doc/eoconv.1 $pkgdir/usr/share/man/man1 || return 1
}

# vim:set ts=2 sw=2 et:
