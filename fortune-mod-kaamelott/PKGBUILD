# Maintainer: François Tessier <pro.tessier.f@gmail.com>
pkgname=fortune-mod-kaamelott
pkgver=1
pkgrel=1
pkgdesc="French Fortune cookies from Kaamelott"
arch=(any)
license=('CCPL')
depends=(fortune-mod)
makedepends=(coreutils)
source="http://www.francoistessier.info/blog/wp-content/uploads/2011/02/fortune-kaamelott.tar.gz"
url="http://www.francoistessier.info/blog/2011/02/14/mon-premier-paquet-aur-fortune-mod-kaamelott"
md5sums=('a490897ecfdf4b1944e1411bd97b6a17')


build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share/fortune
  fold -w 80 -s fortune-kaamelott/kaamelott > \
  	$startdir/pkg/usr/share/fortune/kaamelott || exit 1
  strfile $startdir/pkg/usr/share/fortune/kaamelott || exit 2
}

