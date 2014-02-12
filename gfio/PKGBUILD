# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=gfio
pkgver=2.1
pkgrel=4
pkgstr=2.1.4
pkgdesc="GTK2 frontend for fio benchmarking tool"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/fio"
license=('GPL2')
depends=("fio=${pkgver}" 'gtk2')
source=("http://brick.kernel.dk/snaps/fio-${pkgstr}.tar.bz2"
	"gfio.desktop")

sha1sums=('58b8ad8b0c83a01d754e1dc854336a91c4ca5c2e'
          'e6e449e977f47c97829b0064762e265fb7afe4ed')

build() {
	cd $srcdir/fio-${pkgstr}
	./configure --enable-gfio
	make gfio
}

package() {
	cd $srcdir/fio-${pkgstr}

	# binary
	install -Dm755 gfio "${pkgdir}/usr/bin/gfio"

	# desktop file
	install -Dm644 "${srcdir}/gfio.desktop" "${pkgdir}/usr/share/applications/gfio.desktop"

	# documentation
	install -Dm644 GFIO-TODO "${pkgdir}/usr/share/doc/fio/GFIO-TODO"
}

