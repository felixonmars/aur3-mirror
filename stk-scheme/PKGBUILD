# submitter perlawk
# Maintainer perlawk

pkgname=stk-scheme
_pkgname=STk
pkgver=4.0.1
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="STk is a free R5RS Scheme with Tk built-in."
url="http://kaolin.essi.fr/STk/"
license=('GPL')
depends=()
install=stk.install
source=("ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/STk-4.0.1.tar.gz")

build() {
  cd $srcdir/$_pkgname-$pkgver
	CPPFLAGS='' CFLAGS='' CXXFLAGS='' LDFLAGS='' ./configure --prefix="$pkgdir"/usr 
  make 
}

package() {
  cd $srcdir/$_pkgname-$pkgver
	make DESTDIR="$pkgdir/usr" install 
	make DESTDIR=$pkgdir install.libs
	rm -f $pkgdir/usr/bin/*
}
md5sums=('4f21cae40a619193ee081eafaa58a5be')
