# maintainer: perlawk
# 
# some notice:
# for the purpose of using this old good standard C functions
# I used 10 hours to find the bugs in 64bit environment.
# in the blessing of the SQLite author:
# May you share freely, never taking more than you give.
#
#######################################################

pkgname=sfl
pkgver=2.1
pkgrel=1
pkgdesc="the imatix standard function library"
arch=('x86_64' 'i686')
url="http://legacy.imatix.com/html/sfl/sfl.htm"
license=('custom')
install=
source=("http://legacy.imatix.com/pub/sfl/src/${pkgname}src21.tgz"
"sfl.patch" "run_test.sh" "test.xml")

prepare() {
  cd "$srcdir"

if [ "$CARCH" == 'x86_64' ]; then
	patch < "$srcdir"/../sfl.patch
for f in *h
do
sed -i '1i\
#define __64BIT__' $f
done
fi

}

build() {
  cd "$srcdir"

  gcc -fpic -shared sf*.c -o libsfl.so
  install -D -m755 libsfl.so $pkgdir/usr/lib/libsfl.so
  mkdir -p "pkgdir/sfl"
  for i in $(ls *.h); do install -D $i $pkgdir/usr/include/sfl/$i; done
}

md5sums=('06bb87a94748c0c4d4c7b5ad4f285a69'
         '0b8ae709a0e137b0eba075162e35fe5d'
         'd218d53a4ccd36f769397200818fb213'
         '4866e533e91a84110d0f99e8e2a8cd71')
