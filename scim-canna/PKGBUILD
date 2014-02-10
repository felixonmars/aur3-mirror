# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=scim-canna
pkgver=1.0.1
pkgrel=1
pkgdesc='SCIM IMEngine module for Canna'
arch=('i686' 'x86_64')
url="http://sourceforge.jp/projects/scim-imengine/"
license=('GPL')
depends=('canna' 'scim')
source=("http://jaist.dl.sourceforge.jp/scim-imengine/29155/scim-canna-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/scim-canna-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/scim-canna-${pkgver}"
	make DESTDIR="$pkgdir" install
}

md5sums=('41bf2796c95689df740be07922c74f67')
