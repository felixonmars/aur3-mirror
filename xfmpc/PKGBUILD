# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Marc St-Laurent <mstlaurent@canada.com>

pkgname=xfmpc
pkgver=0.2.2
pkgrel=3
pkgdesc="A graphical GTK+ MPD client focusing on low footprint"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/xfmpc/"
license=('GPL')
depends=('libxfce4ui' 'libmpd')
makedepends=('intltool' 'pkgconfig')
source=("http://archive.xfce.org/src/apps/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

sha256sums=('ed0cc2940bd5928bb30fab1531c22185a97bd0cc5beacd9e3be4d4cd994a6862')
