# Contributor: Pierre Gueth <gueth@crans.org>
pkgname=spring-map-1on1
pkgver=91.0
pkgrel=1
pkgdesc="1on1 spring maps pack"
arch=(i686 x86_64)
url="http://spring.clan-sy.com/"
license=(GPL2)
depends=(spring)
source=("http://sourceforge.net/projects/springrts/files/springrts/spring-91.0/spring_91.0_src.tar.gz/download")
md5sums=('63acccf06892963f719b7144fd08f5d5')

build() {
  mkdir -p $pkgdir/usr/share/spring/maps
  install -D -m 644 -t $pkgdir/usr/share/spring/maps $srcdir/*.sd7 
}
