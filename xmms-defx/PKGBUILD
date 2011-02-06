
# Contributor: Sergio Vergara <arkanox@gmail.com>
pkgname=xmms-defx
pkgver=0.9.9
pkgrel=1
pkgdesc="DeFX Multi-effects processor Plug-in for XMMS"
url="http://defx.sourceforge.net/index.html"
license="GPL"
depends=('gtk' 'xmms')
install=
source=(http://surfnet.dl.sourceforge.net/sourceforge/defx/$pkgname-$pkgver.tar.gz)
md5sums=('89d1e2dce6fcb8eedada91891366a9ba')
build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  mkdir -p $startdir/pkg/usr/lib/xmms/Effect/
  cp $startdir/src/libdefx.so $startdir/pkg/usr/lib/xmms/Effect/ 
}

