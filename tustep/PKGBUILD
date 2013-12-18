# Maintainer: Andreas dot Wagner at em dot uni-frankfurt dot de

pkgname=tustep
pkgver=2013
pkgrel=1
pkgdesc="Toolbox for scholarly processing of textual data"
url="http://www.tustep.uni-tuebingen.de/tustep_eng.html"
arch=('i686' 'x86_64')
install=tustep.install
license=('BSD')
makedepends=('gcc-fortran' 'unzip')
source=(http://downloads.sf.net/project/$pkgname/$pkgname/$pkgver/tustep_cmplnk.zip)

prepare() {
  unzip -uo tustep_cmplnk.zip
  echo Patching source files
#  sed -i "s#f77 -c -m32 -O -fno-backslash#gfortran -c -m32 -std=legacy -ff2c -frecursive -fno-backslash -O2 -Wno-aggressive-loop-optimizations#" "$srcdir/f-cmp"
#  sed -i "s#f77 -m32 -static#gfortran -std=legacy -m32#"					  "$srcdir/f-lnk"
  sed -i "s#f77 -c -m32 -O -fno-backslash#gfortran -c -std=legacy -ff2c -frecursive -fno-backslash -O2 -Wno-aggressive-loop-optimizations#" "$srcdir/f-cmp"
  sed -i "s#f77 -m32 -static#gfortran -std=legacy#"					  "$srcdir/f-lnk"
#  sed -i "s#cc -c -m32 -O -I/user/include#gcc -c -O2 -m32 -I/usr/include#"			  "$srcdir/c-cmp"
#  sed -i "s#cc -m32 -static#gcc -m32 -static#"							  "$srcdir/c-lnk"
  sed -i "s#cc -c -m32 -O -I/user/include#gcc -c -O2 -I/usr/include#"			  "$srcdir/c-cmp"
  sed -i "s#cc -m32 -static#gcc -static#"							  "$srcdir/c-lnk"
  sed -i "s#????????????#Archlinux#"								  "$srcdir/all/version.h"
}

build() {
  ./cmplnk
}

package() {
  install -d -m755 "$pkgdir/usr/share/licenses/tustep"
  install -m644 "$srcdir/tustep/licence.txt" "$pkgdir/usr/share/licenses/tustep/licence.txt"
  install -d -m755 "$pkgdir/opt"
  cp -r "$srcdir/tustep" "$pkgdir/opt/tustep"
  chmod 755 "$pkgdir/opt/tustep"
#  install -d -m755 "$pkgdir/usr/bin"
#  ln -s /opt/tustep/start "$pkgdir/usr/bin/tustep"
}

md5sums=('28e694e723c0cc84a067ef7747717cb6')
