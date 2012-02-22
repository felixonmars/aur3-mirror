# Maintainer: Thibaut Horel <thibaut dot horel at gmail dot com>
pkgname=dircproxy
pkgver=1.2.0_RC1
pkgrel=1
pkgdesc="An IRC proxy server (bouncer)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/dircproxy/"
license=('GPL2')
groups=()
backup=('etc/dircproxyrc')
source=("http://dircproxy.googlecode.com/files/$pkgname-${pkgver//_/-}.tar.gz"
	"dircproxy" "dircproxy.conf.d")
sha1sums=('7dc4b3aa2e10222f74e280de69c41f571335a96b'
          'feb1e2d43fdadd4b23e8fb78ec8e2bfc61208a14'
          '5c32c5f6f1910e4c13c0473da0aac766ce52f5b9')
build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  make DESTDIR="$pkgdir/" install
  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 INSTALL NEWS README FAQ ChangeLog AUTHORS $pkgdir/usr/share/doc/$pkgname
  install -Dm644 conf/dircproxyrc.sample $pkgdir/etc/dircproxyrc
  install -Dm755 ../../dircproxy $pkgdir/etc/rc.d/dircproxy
  install -Dm644 ../../dircproxy.conf.d $pkgdir/etc/conf.d/dircproxy  
}

# vim:set ts=2 sw=2 et: