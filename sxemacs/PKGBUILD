# Contributor: perlawk
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=sxemacs
pkgver=22.1.15
pkgrel=1 
pkgdesc="A derivation of xemacs"
url="http://www.sxemacs.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libffi' 'xbitmaps' 'libpng' 'libao' 'gpm' 'libtiff' 'libjpeg' 'xaw3d' 'openssl' 'libltdl' 'libxpm' 'jack' 'libmad' 'desktop-file-utils' 'libxaw')
makedepends=()
conflicts=('xemacs')
provides=('sxemacs')
backup=()
install=
source=(http://downloads.sxemacs.org/releases/$pkgname-$pkgver.tar.bz2)
md5sums=('bc560f6bb01f2f78a738adc0984cd679')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 2s+cl.info+cl-sxemacs.info+ info/cl.texi
  sed -i 2s+widget.info+widget-sxemacs.info+ info/widget.texi
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
