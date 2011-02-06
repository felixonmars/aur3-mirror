# Maintainer:  <>
# Contributor: Ali H. Caliskan <ali.h.caliskan@gmail.com>
pkgname=enemylines5
pkgver=1.0
pkgrel=1
pkgdesc="Enemy lines - computer game series"
arch=('i686' 'x86_64')
url="http://proj.phk.at/el/5/"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'sdl_image')
source=("http://proj.phk.at/el/5/${pkgname}-${pkgver}.tar.bz2"
	'enemylines5.patch')
md5sums=('97dae238ed979e8ec128ccc7791a0ba4'
	 '86830cafe76dd73dfb2cb36dc9a24d1e')

build() {
  patch -Np1 -i $srcdir/enemylines5.patch
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  install -d $startdir/pkg/usr/bin
  install -d $startdir/pkg/usr/share/enemylines5
  make DESTDIR="$pkgdir/" install
}
