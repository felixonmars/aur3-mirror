# Maintainer: Jens Staal <staal1978@gmail.com>
 
pkgname=fribid-stable
pkgver=1.0.3
pkgrel=2
pkgdesc="A Free re-implementation of the Swedish BankID/eID system"
arch=('i686' 'x86_64')
url="http://fribid.se/"
license=('custom')
depends=('gettext' 'glib2' 'gtk2' 'openssl' 'opensc' 'libp11')
optdepends=('pcsclite-libudev' 'openct')
provides=('nexuspersonal')
conflicts=('nexuspersonal' 'fribid-git')
source=("http://fribid.se/releases/source/fribid-${pkgver}.tar.bz2")
md5sums=('062d40b6a73c020d0aae1d581b45a9c6')
 
 
build() {

cd $srcdir/fribid-$pkgver
   ./configure --prefix=/usr --pkcs11-module=/usr/lib/pkcs11/opensc-pkcs11.so
   sed -i 's/-DGTK_DISABLE_DEPRECATED=1 -DGDK_DISABLE_DEPRECATED=1 -DG_DISABLE_DEPRECATED=1//' client/Makefile
   make
}
 
package() {
cd  $srcdir/fribid-$pkgver
DESTDIR=$pkgdir make install
mkdir -p $pkgdir/usr/share/licenses/fribid
install -m644 $srcdir/fribid-$pkgver/LICENSE $pkgdir/usr/share/licenses/fribid/
} 
