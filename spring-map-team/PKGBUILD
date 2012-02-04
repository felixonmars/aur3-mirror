# Contributor: Pierre Gueth <gueth@crans.org>
pkgname=spring-map-team
pkgver=1.0
pkgrel=1
pkgdesc="teamplay spring maps pack"
arch=(i686 x86_64)
url="http://spring.clan-sy.com/"
license=(GPL2)
depends=(spring)
source=("http://sd-12155.dedibox.fr/~pierre/spring/spring-maps-team.tar.gz")
md5sums=('b2f531becf54cb9d9db4dcfec5b7bffb')

build() {
  mkdir -p $pkgdir/usr/share/spring/maps
  install -D -m 644 -t $pkgdir/usr/share/spring/maps $srcdir/*.sd7 $srcdir/*.sdz
}
