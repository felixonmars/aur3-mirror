# Contributor: Paul Bredbury <brebs@sent.com>

pkgname=jnettop
pkgver=0.13.0
pkgrel=3
pkgdesc="A top-like console network traffic visualizer"
arch=(i686 x86_64)
url="http://jnettop.kubs.info/wiki/"
license=('GPL')
depends=('libpcap' 'glib2')
makedepends=('pkgconfig')
source=(http://jnettop.kubs.info/dist/$pkgname-$pkgver.tar.gz)
md5sums=('9529d75011026b3fcaf185b2fb063881')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  # Docs
  mkdir -p $startdir/pkg/usr/share/doc/$pkgname
  install -m644 -t $startdir/pkg/usr/share/doc/${pkgname}/ AUTHORS ChangeLog NEWS README .jnettop || return 1
}
