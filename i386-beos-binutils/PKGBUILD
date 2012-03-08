pkgname=i386-beos-binutils
pkgver=2.22
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (BeOS)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
depends=('glibc')
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2)
md5sums=('ee0f10756c84979622b992a4a61ea3f5')

build() {
  cd ${srcdir}/binutils-$pkgver
  ./configure --prefix=/usr --target=i386-beos --host=$CHOST --build=$CHOST --disable-nls
  make
  make DESTDIR=$pkgdir install
  rm -rf $pkgdir/usr/lib
  rm -rf $pkgdir/usr/share/{info,man}
}