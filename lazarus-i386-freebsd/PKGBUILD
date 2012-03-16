pkgname=lazarus-i386-freebsd
pkgver=0.9.30.4
pkgrel=1
pkgdesc='Lazarus Component Library (i386-freebsd)'
url='http://www.lazarus.freepascal.org/'
license=('GPL2' 'MPL' 'custom:LGPL')
arch=('any')
depends=('fpc' 'fpc-src' 'fpc-i386-freebsd-rtl' 'lazarus')
conflicts=(fpc-i386-freebsd-lcl)
provides=(fpc-i386-freebsd-lcl)
makedepends=('ppcross386')
options=('!emptydirs' '!makeflags')
source=("http://downloads.sourceforge.net/project/lazarus/Lazarus%20Zip%20_%20GZip/Lazarus%20$pkgver/lazarus-$pkgver-src.tar.bz2")
md5sums=('ebd40cdfdfc4b66d1ced7a0d48d6da84')

build() {
  cd "$srcdir/lazarus"
  make FPC="/usr/bin/fpc" clean lcl packager/registration ideintf packager components OS_TARGET=freebsd CPU_TARGET=i386
}

package() {
  cd "$srcdir/lazarus"
  
  # skip the 'make install' mess completely and do everything manually
  mkdir -p "$pkgdir/usr/lib/lazarus"
  find . -type f -path *i386-freebsd* -exec cp --parents '{}' "$pkgdir/usr/lib/lazarus/" \;
}

