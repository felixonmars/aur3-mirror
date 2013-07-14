# Maintainer: blackleg <hectorespertpardo@gmail.com>

pkgname=gplane-git
pkgver=ba45fb0
pkgrel=1
pkgdesc='Gtk3 Flightgear launcher (Git version)'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/blackleg/gplane'
provides=('gplane')
conflicts=('gplane')
depends=("flightgear")
makedepends=('git')
source=("${pkgname}::git+https://github.com/blackleg/gplane.git")
md5sums=('SKIP')


pkgver () {
  cd "${srcdir}/${pkgname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR=${pkgdir} install 
	

	
}
