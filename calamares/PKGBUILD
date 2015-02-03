# Maintainer: Iwan Timmer <irtimmer@gmail.com>
# Maintainer: Philip Müller <philm[at]manjaro[dog]org>

pkgname=calamares
pkgver=1.0.1
pkgrel=1
pkgdesc='Distribution-independent installer framework'
arch=('i686' 'x86_64')
license=(GPL)
url="http://calamares.io/"
license=('LGPL')
conflicts=('calamares-git')
depends=('kconfig' 'kcoreaddons' 'ki18n' 'solid' 'yaml-cpp' 'parted' 'boost' 'hwinfo' 'qt5-svg')
makedepends=('extra-cmake-modules' 'git' 'qt5-tools')
backup=('usr/share/calamares/modules/displaymanager.conf'
        'usr/share/calamares/modules/grubcfg.conf'
        'usr/share/calamares/modules/initcpio.conf'
        'usr/share/calamares/modules/unpackfs.conf')
source=('https://github.com/calamares/calamares/archive/v1.0.1.tar.gz'
        'git+https://github.com/calamares/partitionmanager.git#branch=calamares')
sha256sums=('2ad82af5771515c7067fc88e92906ec9d83472dd45d12944540229a5c564fa8a'
            'SKIP')


prepare() {
	cd "$srcdir/calamares-$pkgver"

	rm -r src/modules/partition/partitionmanager
	ln -s ../../../../partitionmanager src/modules/partition/partitionmanager
}

build() {
	cd "$srcdir/calamares-$pkgver"

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
	cd "$srcdir/calamares-$pkgver/build"

	make DESTDIR="$pkgdir" install
}
