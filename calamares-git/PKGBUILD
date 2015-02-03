# Maintainer: Iwan Timmer <irtimmer@gmail.com>
# Maintainer: Philip Müller <philm[at]manjaro[dog]org>

pkgname=calamares-git
pkgver=v1.0.1.r3.g047141a
pkgrel=1
pkgdesc='Distribution-independent installer framework'
arch=('i686' 'x86_64')
license=(GPL)
url="https://github.com/calamares"
license=('LGPL')
depends=('kconfig' 'kcoreaddons' 'ki18n' 'solid' 'yaml-cpp' 'parted' 'boost' 'hwinfo' 'qt5-svg')
makedepends=('extra-cmake-modules' 'git' 'qt5-tools')
backup=('usr/share/calamares/modules/displaymanager.conf'
        'usr/share/calamares/modules/grubcfg.conf'
        'usr/share/calamares/modules/initcpio.conf'
        'usr/share/calamares/modules/unpackfs.conf')
source=('git+https://github.com/calamares/calamares.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/calamares"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/calamares"

	git submodule init
	git submodule update
}

build() {
	cd "$srcdir/calamares"

	mkdir -p build
	cd build
        cmake .. \
              -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DWITH_PARTITIONMANAGER=1 \
              -DCMAKE_INSTALL_LIBDIR=lib
        make
}

package() {
	cd "$srcdir/calamares/build"

	make DESTDIR="$pkgdir" install
}
