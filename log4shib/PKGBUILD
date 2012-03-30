# Maintainer: Kaiting Chen <kaitocracy@gmail.com>

pkgname='log4shib'
pkgver='1.0.4'
pkgrel='2'
pkgdesc='A forked version of log4cpp created for Shibboleth'
license=('LGPL')
url='https://spaces.internet2.edu/display/OpenSAML/log4shib/'
arch=('i686' 'x86_64')
options=('!libtool')
depends=('gcc-libs')

md5sums=('7dcec788b0b73923dde9756869edc011')
source=("http://shibboleth.internet2.edu/downloads/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --without-idsa \
    --disable-dot \
    --disable-doxygen
  make; make DESTDIR=$pkgdir install
}
