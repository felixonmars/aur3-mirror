# Maintainer: Elia Notarangelo <elia.notarangelo AT gmail DOT com>
# Contributor: Michele Angelico <tomberro AT gmail DOT com>

pkgname=faenza-xfce-blue
pkgver=0.1
pkgrel=1
pkgdesc="xfce icons theme inspired to Faenza Blue"
url="http://www.xfce-italia.it"
license=('GPL3')
arch=('any')
depends=('faenza-icon-theme')
makedepends=()
source=("http://master.dl.sourceforge.net/project/archmind/$pkgname-$pkgver.tar.gz")

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	ICONS_DIR=${pkgdir}/usr/share/icons

	install -d ${ICONS_DIR}

	cp -rf Faenza-Xfce-Blue ${ICONS_DIR}/
	cp -rf Faenza-Xfce-Blue-Dark ${ICONS_DIR}/
}


md5sums=('1075de64c4c18456550ba63df78367c1')
