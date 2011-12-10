# Maintainer: Philipp Überbacher <murks at lavabit dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=bitmeter
pkgver=1.2
pkgrel=2
pkgdesc="Also known as jack bitscope. Useful to detect denormals."
arch=('i686' 'x86_64')
url="http://devel.tlrmx.org/audio/bitmeter/"
license=('GPL')
depends=('gtk2' 'jack')
source=(http://devel.tlrmx.org/audio/source/${pkgname}-${pkgver}.tar.gz)
md5sums=('c27e07770cb74658960a5c55719e341e')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  LDFLAGS='-lm' ./configure --prefix=/usr
  make
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
