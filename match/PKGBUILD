# submitter: perlawk
# Maintainer: perlawk

pkgname=match
pkgver=1.1
pkgrel=1
pkgdesc="Pattern matching is a powerful tool for syntax analysis. The main idea of pattern matching comes from the SNOBOL4 language."
url="http://www.dmitry-kazakov.de/match/match.htm"
arch=('x86_64' 'i686')
license=('GPLv3')
install=
options=(!strip)
source=("http://www.dmitry-kazakov.de/match/match_1_1.tgz")
 
build() {
  cd "${srcdir}/"
	sed -i '/SILENCE/d;' gcc.mak
	gcc -fpic -shared match.c -o libmatch.so
  make -f gcc.mak match

}
 
package() {
  cd "${srcdir}/"
 	mkdir -p "$pkgdir/usr/bin" 
 	mkdir -p "$pkgdir/usr/include/" 
 	mkdir -p "$pkgdir/usr/share/match/" 
 	mkdir -p "$pkgdir/usr/lib/" 
	cp -a match "$pkgdir/usr/bin" 
	cp libmatch.so "$pkgdir/usr/lib/" 
 	cp match.h pattern.h patran.h "$pkgdir/usr/include/" 
 	cp match.htm *gif *jpg "$pkgdir/usr/share/match/" 
}
md5sums=('f7cbef877ee860230a92bcf98c3826e9')
