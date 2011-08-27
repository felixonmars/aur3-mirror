# Maintainer: Henning Garus <henning.garus@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>

pkgname=lss
pkgver=0.1.6
pkgrel=2
pkgdesc="LaTeX Symbols Selector (LSS) is a symbol browser to help creating LaTeX documents with many math symbols"
arch=('i686' 'x86_64')
url="http://clayo.org/lss"
license=('GPL')
depends=('gtk2' 'libxml2')
source=(http://clayo.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('8772b8765ea19f1aa765af4ae9ea20bc')
sha1sums=('e3df1b90a6d2fe774230dbfc23be7f5396804b6a')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
