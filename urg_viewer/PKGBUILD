# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=urg_viewer
pkgver=2.0.7
pkgrel=1
pkgdesc='Data viewer for Hokuyo URG series sensors'
arch=('i686' 'x86_64')
url="http://sourceforge.net/p/urgnetwork/wiki/Home/"
license=('GPL')
depends=('qt4' 'mesa')
source=("http://downloads.sourceforge.net/project/urgnetwork/Urg_Viewer/Urg_viewer-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/Urg_viewer-${pkgver}"
	qmake-qt4
	make
}

package() {
	cd "${srcdir}/Urg_viewer-${pkgver}"
	install -Dm755 Urg_viewer "$pkgdir/usr/bin/urg_viewer"
}

md5sums=('7a2598e73ba150f93c2de4e03f4b05d1')
