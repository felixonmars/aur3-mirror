# Maintainer: Weirch Sodora  <sodora at gmail dot com>

pkgname=stardict-cdict-gb
pkgver=2.4.2
pkgrel=3
pkgdesc="English Chinese dictionary CDICT5 for Stardict"
license=('GPL')
depends=('stardict')
url="http://abloz.com/huzheng/stardict-dic/zh_CN/"
md5sums=('68e539f362de416490b78fed97aba780')
source=("${url}${pkgname}-${pkgver}.tar.bz2")
arch=('any')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/share/stardict/dic/"
	install -m 644 cdict-gb.dict.dz cdict-gb.idx cdict-gb.ifo "${pkgdir}/usr/share/stardict/dic/"
}
