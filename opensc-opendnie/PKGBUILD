# Maintainer: Antonio Rojas < nqn1976@gmail.com >

pkgname=opensc-opendnie
pkgver=0.12.2
pkgrel=4
pkgdesc="Access smart cards that support cryptographic operations (with open DNIe driver)"
arch=('i686' 'x86_64')
url="http://forja.cenatic.es/projects/opendnie/"
license=("LGPL")
options=('!libtool')
depends=('openssl' 'ccid' 'pinentry' 'libltdl')
makedepends=()
provides=('opensc')
conflicts=('opensc')
source=("http://forja.cenatic.es/frs/download.php/latestfile/290/$pkgname-$pkgver.tar.gz")
md5sums=('5e9db0ecaeec8748fcfa8e149b9ff236')

build() {
  cd $srcdir/opensc-$pkgver/
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  # workaround broken make install
  install -d $pkgdir/{etc,usr/lib/pkcs11}

  cd $srcdir/opensc-$pkgver/
  make DESTDIR=$pkgdir install
}
