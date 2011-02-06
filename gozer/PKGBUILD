# Maintainer: andreas_baumann <abaumann@yahoo.com>

pkgname=gozer
pkgver=0.7
pkgrel=2
pkgdesc="A command-line utility for rendering images of text with AA and TTF support"
arch=('i686' 'x86_64')
url="http://linuxbrit.co.uk/gozer/"
license="custom"
depends=('imlib2' 'giblib' 'freetype2')
source=(gozer_0.7.nofont.1.orig.tar.gz)
md5sums=('52c0d2062552edf8d1719ff6329429dc')

build() {
  cd $srcdir/gozer-0.7.nofont.1.orig
  ./configure --prefix=/usr || return 1
  make || return 1
  make prefix=$pkgdir/usr install
}
