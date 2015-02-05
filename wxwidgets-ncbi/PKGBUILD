# Maintainer: leepesjee <lpeschier at xs4all dot nl>
pkgname=wxwidgets-ncbi
pkgver=2.8.12
pkgrel=2
pkgdesc="wxWidgets configured for use with the ncbi C/C++ toolkits."
arch=('i686' 'x86_64')
url=http://www.wxwidgets.org/
license=('LGPL')
depends=('gtk2' 'libsm')
source=("http://downloads.sourceforge.net/project/wxwindows/${pkgver}/wxWidgets-${pkgver}.tar.gz")
md5sums=('2fa39da14bc06ea86fe902579fedc5b1')

prepare() {
  cd "wxWidgets-$pkgver"
  sed -i 's|png_check_sig|png_sig_cmp|' ./configure
  sed -i 's|$SEARCH_LIB|$SEARCH_LIB /usr/lib|' ./configure
}

build() {
  cd "wxWidgets-$pkgver"
  ./configure --prefix=/opt/ncbi/wxwidgets-ncbi --with-opengl --disable-monolithic --disable-sockets --with-gtk --disable-unicode
  make
}

package() {
  cd "wxWidgets-$pkgver"
  mkdir -p $pkgdir/opt/ncbi/$pkgname
  make DESTDIR="$pkgdir/" install
}
