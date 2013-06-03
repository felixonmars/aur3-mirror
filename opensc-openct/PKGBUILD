# Aur Mantainer: Jaime Machado <jaime.machado@gmail.com>
# A version of opensc from community using openct instead of pcsc.

pkgname=opensc-openct
pkgver=0.13.0
pkgrel=2
pkgdesc='Access smart cards that support cryptographic operations (version 0.13) using openct'
arch=('x86_64' 'i686')
url='https://github.com/OpenSC/OpenSC'
license=('LGPL')
backup=('etc/opensc.conf')
makedepends=('docbook-xsl')
depends=('openssl' 'pcsclite' 'libltdl' 'openct')
options=('!libtool' '!emptydirs')
conflicts=('opensc')
provides=('opensc=0.13.0')
source=("https://github.com/OpenSC/OpenSC/archive/$pkgver.tar.gz")
md5sums=('92ed0041be8e5c53aa48c371b090b6cd')
 
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
    --disable-pcsc \
    --enable-openct \
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
