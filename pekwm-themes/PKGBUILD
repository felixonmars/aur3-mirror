pkgname=pekwm-themes
pkgver=1.0.5
pkgrel=1
pkgdesc="Pekwm themes collection"
arch=('i686' 'x86_64')
license=("GPL")
url=http://www.obliquo.net
depends=(pekwm)
source=(pekwm-themes-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname
  mkdir -p $startdir/pkg/usr/share/pekwm/themes
  cp -R $startdir/src/$pkgname/* $startdir/pkg/usr/share/pekwm/themes/
}
md5sums=('ad86e2467ef270e852507bc45d1cdfe5')
