# Maintainer: Peter Enerccio <enerccio@gmail.com>
# Contributor:  Leslie P. Polzer <polzer@stardawn.org>
pkgname=libminizip
pkgver=1.1
pkgrel=1
pkgdesc="ZIP file extraction library"
url="http://www.winimage.com/zLibDll/minizip.html"
license="zlib"
arch=('i686' 'x86_64')
depends=()
provides=('libminizip')
source=(http://www.winimage.com/zLibDll/unzip11.zip)
md5sums=('29d6914e204292fa3bcd8f157a735793')
sha1sums=('47eefda2456cc9645bb7751f1a96fd6191da45f8')
build() {
  cd $startdir/src

  gcc -fPIC -shared zip.c unzip.c ioapi.c -o libminizip.so.1

  install -m755 -D libminizip.so.1 $startdir/pkg/usr/lib/libminizip.so.1
  cd $startdir/pkg/usr/lib && ln -sf libminizip.so.1 libminizip.so

  cd $startdir/src
  mkdir -p $startdir/pkg/usr/include
  install -m644 zip.h unzip.h ioapi.h $startdir/pkg/usr/include
}
