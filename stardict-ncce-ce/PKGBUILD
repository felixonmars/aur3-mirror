# Maintainer: Weirch Sodora <sodora at gmail dot com>

pkgname=stardict-ncce-ce
pkgver=2.4.2
pkgrel=3
pkgdesc="Chinese English dictionary NCCE for Stardict"
license=('GPL')
depends=('stardict')
url="http://abloz.com/huzheng/stardict-dic/zh_CN/"
md5sums=('5f4c605485fc3c7ade7c341d9aad6719')
source=("${url}${pkgname}-${pkgver}.tar.bz2")
arch=('any')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/share/stardict/dic/"
	install -m 644 ncce-ce.dict.dz ncce-ce.idx ncce-ce.ifo "${pkgdir}/usr/share/stardict/dic/"
}

