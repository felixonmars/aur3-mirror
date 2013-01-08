# Aur Mantainer: Aleksei Lissitsin <aleksei.lissitsin@gmail.com>
# This is basically a copy from a previous version of opensc in community.
# Maintainer: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: kevku <kevku@msn.com>

pkgname=opensc012
pkgver=0.12.2
pkgrel=2
pkgdesc='Access smart cards that support cryptographic operations (version 0.12)'
arch=('x86_64' 'i686')
url='https://github.com/OpenSC/OpenSC'
license=('LGPL')
backup=('etc/opensc.conf')
makedepends=('docbook-xsl')
depends=('openssl' 'pcsclite' 'libltdl')
options=('!libtool' '!emptydirs')
conflicts=('opensc')
provides=('opensc=0.12.2')
source=("https://github.com/OpenSC/OpenSC/archive/$pkgver.tar.gz")
md5sums=('3fbd89666297bc1020a8f38fffe94e63')
 
build() {
  cd OpenSC-$pkgver
  export LIBS=-lltdl
  _sheetdir=(/usr/share/xml/docbook/xsl-stylesheets-*)
  ./bootstrap
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-man \
    --enable-doc \
    --enable-readline \
    --enable-openssl \
    --enable-pcsc \
    --enable-zlib \
    --with-xsl-stylesheetsdir="$_sheetdir"
  make
}
 
package(){
  mkdir $pkgdir/etc
  mkdir -p $pkgdir/usr/lib/pkcs11	
  cd OpenSC-$pkgver
  make DESTDIR="$pkgdir" install
} 
