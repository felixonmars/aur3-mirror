#contributor: Josef Zila <josefzila@gmail.com> 

pkgname=lparser
pkgver=1.0
pkgrel=1
pkgdesc="Lsystem parser (Lsystem is a rule like description of a 3d form)"
url="http://home.wanadoo.nl/laurens.lapre/lparser.html"
source=(http://home.wanadoo.nl/laurens.lapre/source.zip my.patch)
md5sums=('c3352f9f99352fa47d49c86760b05903' '3c5c9107a80cd4f2e31b3bf76206e465')

build() {
  patch -p0 LPARSER.C my.patch
  echo "gcc -ansi -lm -lstdc++ -o lparser LPARSER.C"
  gcc -ansi -lm -lstdc++ -o lparser LPARSER.C
  install -m755 -D lparser $startdir/pkg/usr/bin/lparser 
}
