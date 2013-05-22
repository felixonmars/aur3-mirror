pkgname=banshee-community-extensions
pkgver=2.4.0
pkgrel=1
pkgdesc="Banshee Community Extensions is a repository and project for extensions to the Banshee media player that are community contributed and maintained"}
arch=('i686' 'x86_64')
url="http://banshee.fm/"
license=('GPL2')
depends=('mono' 'banshee>=2.4.0' 'webkit-sharp' 'sqlite3' 'intltool')
optdepends=('banshee-youtube: for banshee with youtube extension enabled')
#makedepends=('git')
source=(http://download.banshee.fm/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('6f20404de80090bb5d88a57c043e876a192f480ac3488ce7697344f1447d48b3')

build() {
	cd "${srcdir}"/${pkgname}-$pkgver
	./configure --prefix=/usr
	make
}
package() {
	cd "${srcdir}"/${pkgname}-${pkgver}/bin
	mkdir -p "${pkgdir}"/usr/lib/banshee/Extensions
	cp -a * "${pkgdir}"/usr/lib/banshee/Extensions
}
