# Maintainer: Tocer Deng <tocer.deng@gmail.com>
# Contributor: Axper Jan <483ken @at@ gmail

pkgname=winhelpcgi
pkgver=1.0_1
pkgrel=2
pkgdesc="Publishes windows help files (.HLP) and Multimedia Viewer 2.0 titles (.MVB) from a web server to be readable from any web browser"
arch=('i686' 'x86_64')
url="http://www.herdsoft.com/linux/produkte/winhelpcgi.html"
license=('GPL2')
depends=('libwmf')
source=("http://www.herdsoft.com/ftp/${pkgname}_1.0-1.tar.gz"
        "package.patch")
md5sums=('53b045588e28e5873059968e77a6c800'
         '7fbd1afdb39ad1945b705ffb72f8518d')

build() {
  cd "$srcdir/$pkgname-1.0"
  patch -p1 -i $srcdir/package.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-1.0"
  make DESTDIR="$pkgdir/" install
}
# vim:set ts=2 sw=2 et:
