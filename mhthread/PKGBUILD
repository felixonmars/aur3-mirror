# Maintainer: Moritz Wilhelmy <moritz+aur@wzff.de>

pkgname=mhthread
pkgver=1.7
pkgrel=1
pkgdesc="Arrange MH-folders in a thread view"
arch=(any)
url="http://jmason.org/software/mhthread/"
license=('GPL')
depends=('perl')
optdepends=('nmh: does not make sense without a MH implementation')
source=('http://jmason.org/software/scripts/mhthread.txt')
md5sums=('51d36e979d96d4dbab595a708ff0c07c')

build() {
  cd "$srcdir"
  pod2man mhthread.txt mhthread.1
  
  install -D -m644 mhthread.1 "$pkgdir/usr/share/man/man1/mhthread.1"
  install -D -m755 mhthread.txt "$pkgdir/usr/bin/mhtread"
}

# vim:set ts=2 sw=2 et:
