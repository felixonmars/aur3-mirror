# Mantainer: Mephistopheles <mephisto.pheles.nyan @ gmail.com>
pkgname=pica-pica
pkgver=0.5.1
pkgrel=1
pkgdesc="Secure Distributed Messaging System WITHOUT CLIENT, JUST NODE"
url="http://picapica.im"
license=('GPL')
depends=( 'openssl' 'sqlite')
arch=('i686' 'x86_64')
source=(http://picapica.im/${pkgname}-${pkgver}.tar.gz)
md5sums=('3d45d26f179ca1a0d9944cfe2f08d4ce')
build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-client
  make || return 1
  make install || return 1
}
