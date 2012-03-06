# Contributor: Jens Adam (byte/jra) <j_adam@web.de>
pkgname=lazarus-cross-i386-win32
pkgver=0.9.30.2
pkgrel=1
pkgdesc='Delphi-like IDE for FreePascal (win32 crosscompiler)'
url='http://www.lazarus.freepascal.org/'
license=('GPL2' 'MPL' 'custom:LGPL')
arch=('any')
depends=('fpc' 'fpc-src' 'gtk2' 'fpc-cross-i386-win32' 'lazarus')
makedepends=('fpc-cross-i386-win32')
conflicts=(lazarus-crossw32)
provides=(lazarus-crossw32)
options=('!emptydirs' '!makeflags')
source=(http://downloads.sourceforge.net/project/lazarus/Lazarus%20Zip%20_%20GZip/Lazarus%20$pkgver/lazarus-$pkgver-src.tar.bz2)
md5sums=('0dcf54613c2f9d38a32d183431e2dfc9')

build() {
  cd $srcdir/lazarus
  make FPC=/usr/bin/fpc clean lcl packager/registration ideintf packager components OS_TARGET=win32 CPU_TARGET=i386
}

package() {
  cd $srcdir/lazarus
  
  # skip the 'make install' mess completely and do everything manually
  mkdir -p $pkgdir/usr/lib/lazarus
  find . -type f -path *i386-win32* -exec cp --parents '{}' $pkgdir/usr/lib/lazarus/ \;
}

