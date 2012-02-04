# Contributor: bl4ckb1t <bl4ckb1t@gmail.com>
pkgname=glm
pkgver=0.3.1
pkgrel=2
pkgdesc="Alias Wavefront OBJ File Reader/Viewer Library"
arch=('i686' 'x86_64')
url="http://devernay.free.fr/hacks/glm/"
license=('GPL')
depends=('freeglut' 'devil' 'libpng' 'libjpeg')
source=(http://devernay.free.fr/hacks/glm/$pkgname-$pkgver.tar.gz)
md5sums=('4364ff9e96c83a80953419bd19e5a19a')

build() {
  cd $startdir/src/$pkgname-$pkgver

  [[ "${CARCH}" == 'x86_64' ]] &&
    sed -ie '215s/examples//' Makefile.in

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  rm -f $startdir/pkg/usr/lib/libglm.la
  install -Dm644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
