# Maintainer: Elvis Angelaccio <elvis dot angelaccio at kdemail dot net>

pkgname=kronometer-git
_pkgname=kronometer
pkgver=1.0.0.r10.g1e71a2c
pkgrel=1
pkgdesc="A simple chronometer application built for KDE."
arch=('i686' 'x86_64')
url="https://github.com/elvisangelaccio/kronometer"
license=('GPL2')
depends=('kdelibs')
makedepends=('automoc4' 'cmake' 'make' 'git')

source=('kronometer::git://github.com/elvisangelaccio/kronometer.git')

# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
		  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
		  .
	make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
} 
