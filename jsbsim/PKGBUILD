# Maintainer: blackleg <blackleg@openmailbox.org>

pkgname=jsbsim
pkgver=CVS_ACCESS_LOST.1016.g4f98558
pkgrel=1
pkgdesc='Open source flight dynamics model libraries'
arch=('i686' 'x86_64')
license=('GPL')
url='https://gitorious.org/jsbsim'
provides=('jsbsim')
depends=()
makedepends=('git')
source=("${pkgname}::git+https://gitorious.org/jsbsim/jsbsim.git")
md5sums=('SKIP')


pkgver () {
  cd "${srcdir}/${pkgname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}"
  cmake ${pkgname} -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=on
  make
}

package() {
	cd "${srcdir}"
	make install DESTDIR="$pkgdir"
}
