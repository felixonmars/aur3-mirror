# Maintainer: Weirch Sodora <sodora at gmail dot com>

pkgname=stardict-ncce-ec
pkgver=2.4.2
pkgrel=3
pkgdesc="English Chinese dictionary NCCE for Stardict"
license=('GPL')
depends=('stardict')
url="http://abloz.com/huzheng/stardict-dic/zh_CN/"
md5sums=('0efe66376be559136957a00df6a77040')
source=("${url}${pkgname}-${pkgver}.tar.bz2")
arch=('any')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/share/stardict/dic/"
	install -m 644 ncce-ec.dict.dz ncce-ec.idx ncce-ec.ifo "${pkgdir}/usr/share/stardict/dic/"
}
