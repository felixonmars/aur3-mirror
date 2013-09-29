# Contributor: Weng Xuetian <wengxt@gmail.com>
# Maintainer: Yegorius <yegorius@domic.us>

pkgname=kmozillahelper-ubuntu
pkgver=0.6
pkgrel=3
pkgdesc="Mozilla KDE Integration (Ubuntu's launchpad version)"
url="https://build.opensuse.org/package/show/openSUSE:Factory/mozilla-kde4-integration"
arch=("i686" "x86_64")
provides=('kmozillahelper')
conflicts=('kmozillahelper')
license=('MIT')
depends=("kdebase-workspace")
makedepends=("cmake" "automoc4")
md5sums=('716147f5c97ee9f9560207c4ab59f5f9')

source=("https://launchpad.net/ubuntu/+archive/primary/+files/kmozillahelper_${pkgver}.orig.tar.gz")

build() {
	mkdir "$srcdir/kmozillahelper-build"
	cd "$srcdir/kmozillahelper-build"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release "$srcdir/kmozillahelper"
	make || return 1
}

package() {
	cd "$srcdir/kmozillahelper-build"
	make DESTDIR="$pkgdir" install
}
