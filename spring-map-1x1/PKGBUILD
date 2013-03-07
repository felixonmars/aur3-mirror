# Contributor: Pierre Gueth <gueth@crans.org>
pkgname=spring-map-1x1
pkgver=91.0
pkgrel=1
pkgdesc="1on1 spring maps pack"
arch=(i686 x86_64)
url="http://spring.clan-sy.com/"
license=(GPL2)
depends=(spring)
source=("http://downloads.sourceforge.net/project/springrts/springrts/spring-91.0/spring_91.0_src.tar.gz?r=http%3A%2F%2Fspringrts.com%2F&ts=1362647504&use_mirror=ignum")
md5sums=('63acccf06892963f719b7144fd08f5d5')

build() {
  mkdir -p $pkgdir/usr/share/spring/maps
  install -D -m 644 -t $pkgdir/usr/share/spring/maps $srcdir/*.sd7 
}
