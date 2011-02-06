# Maintainer : vincentxavier vincentxavier@archlinux.fr
 pkgname=loopback_start
 pkgver=0.1
 pkgrel=2
 pkgdesc="A small daemon to set up the loopback interfaces when you choose 'menu'"
 url="http://vincentxavier.free.fr"
 license="GPL"
 depends=()
 makedepends=()
 provides=()
 conflicts=()
 replaces=()
 backup=()
 install=
 source=(http://vincentxavier.free.fr/arch/$pkgname-$pkgver.tar.gz)
 md5sums=('092cb6a813f772265cc9b62fa833dde6')
 
 build() {
 cd $startdir/src/$pkgname-$pkgver
 install -D -m 755 $startdir/src/$pkgname-$pkgver/lo $startdir/pkg/etc/rc.d/lo
 }