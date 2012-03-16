# Contributor: Jens Adam (byte/jra) <j_adam@web.de>
# Arm-wince edition: Alexey Khromov <zxalexis@gmail.com>
pkgname=lazarus-arm-wince
pkgver=0.9.30.4
pkgrel=1
pkgdesc='Lazarus Component Library (arm-wince)'
url='http://www.lazarus.freepascal.org/'
license=('GPL2' 'MPL' 'custom:LGPL')
arch=('any')
depends=('fpc' 'fpc-src' 'fpc-arm-wince-rtl' 'lazarus')
makedepends=('fpc-arm-wince-rtl' 'ppcrossarm')
options=('!strip' '!emptydirs' '!makeflags')
source=("http://downloads.sourceforge.net/project/lazarus/Lazarus%20Zip%20_%20GZip/Lazarus%20$pkgver/lazarus-$pkgver-src.tar.bz2")
md5sums=('ebd40cdfdfc4b66d1ced7a0d48d6da84')

build() {
  cd "$srcdir/lazarus"
  make FPC="/usr/bin/fpc" clean lcl packager/registration packager OS_TARGET=wince CPU_TARGET=arm
}

package() {
  cd "$srcdir/lazarus"
  
  # skip the 'make install' mess completely and do everything manually
  mkdir -p "$pkgdir/usr/lib/lazarus"
  find . -type f -path *arm-wince* -exec cp --parents '{}' "$pkgdir/usr/lib/lazarus/" \;
}