# Maintainer: Dany Martineau <dany.luc.martineau gmail com>

pkgname=jomar3d
pkgver=1.1
pkgrel=1
pkgdesc="A 3D Martian hunt orchestrated by a lobster"
url="http://studios.chalmion.tuxfamily.org/index.php"
arch=('i686' 'x86_64')
license=('GPL')
depends=('jomar3d-data' 'sdl_mixer' 'glew' 'freeglut')
makedepends=('make')
source=(http://download.tuxfamily.org/chalmion/archives/jomar3d_$pkgver-src.tar.gz Makefile.diff jomar3d.desktop)
install=(jomar3d.install)
md5sums=('df7ff1b8ed88504803846a4ed041073f' '0e7a0ca8ff1866e30e78af17908e0617' '3fb2618a71a353b991b4bcb53a239a4c')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  patch -p0 < ../Makefile.diff
  mv jomar3D.svg jomar3d.svg
  make || return 1
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/$pkgname.desktop" \
  "${pkgdir}/usr/share/applications/$pkgname.desktop" || return 1
}
