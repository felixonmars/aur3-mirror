# submitter: perlawk
# maintainer: perlawk

pkgname=xwpe
pkgver=1.5.30a
pkgrel=1
pkgdesc="Xwpe is a development environment designed for use on UNIX systems. The user interface was designed to mimic the Borland C and Pascal family."
url="http://www.identicalsoftware.com/xwpe/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('ncurses')
install=xwpe.install

source=("http://www.identicalsoftware.com/xwpe/${pkgname}-${pkgver}.tar.gz")
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr 
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"
	cp xwpe  "$pkgdir/usr/bin"
	cp xwpe.1_eng  "$pkgdir/usr/share/man/man1/xwpe.1"
}
md5sums=('11ad41d636f9ff07820ee0869a177a5c')
