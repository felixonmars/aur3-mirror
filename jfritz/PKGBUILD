# Maintainer: Adam Hani Schakaki (krzd) <krzd@krzd.net>

pkgname=jfritz
pkgver=0.7.4.1
pkgrel=1
pkgdesc='FRITZ!Box Call Manager'
arch=('any')
url='http://www.jfritz.org/'
license=('GPL')
depends=('java-runtime')
options=(!strip)
source=(
	"http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/JFritz-${pkgver}.tar.gz"
	'jfritz-usr.tar.bz2'
)

md5sums=(
	'afc09825917aacd873fc0a47d29560d3'
	'bc73e58c14d6967ccc4568405fb4ee86'
)

package() {
	cp -r usr opt $pkgdir
	cp -r ${pkgname}-${pkgver}/* ${pkgdir}/opt/jfritz
}

