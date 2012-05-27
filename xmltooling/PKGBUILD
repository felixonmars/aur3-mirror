# Maintainer: Kaiting Chen <kaitocracy@gmail.com>

pkgname='xmltooling'
pkgver='1.4.2'
_opensamlv='2.4.3'
pkgrel='1'
pkgdesc='High level interface library to XML processing'
arch=('i686' 'x86_64')
url='https://spaces.internet2.edu/display/OpenSAML/XMLTooling-C/'
license=('GPL')
depends=('openssl' 'curl' 'log4shib'
  'xerces-c' 'xml-security-c')

md5sums=('98ed7fb45c63cd6d03446f8c47dc645b')
source=("http://shibboleth.net/downloads/c++-opensaml/$_opensamlv/$pkgname-$pkgver.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  unset LDFLAGS
  ./configure --prefix=/usr \
    --disable-doxygen-doc
  make; make DESTDIR=$pkgdir install
}
