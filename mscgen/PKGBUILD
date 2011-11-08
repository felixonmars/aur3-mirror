# Maintainer: mizux <webmaster@mizux.net>
# Contributor: Peter Simons <simons@cryp.to>
pkgname=mscgen
pkgver=0.20
pkgrel=2
pkgdesc="Message Sequence Chart Generator"
arch=('i686' 'x86_64')
url='http://www.mcternan.me.uk/mscgen/'
license=('GPL')
depends=('gd')
makedepends=('flex' 'bison')
options=(!makeflags)
source=( "http://www.mcternan.me.uk/mscgen/software/$pkgname-src-$pkgver.tar.gz" )
md5sums=('65c90fb5150d7176b65b793f0faa7377')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-freetype
  make all
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
