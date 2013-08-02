# Maintainer: Sergey Yakovlev <me@klay.me>

pkgname=gleez-cerber
pkgver=1.0.0
pkgrel=2
pkgdesc='New responsive cool theme for Gleez CMS with left & right sidebar'
arch=('any')
url='https://github.com/sergeyklay/gleez-cerber'
license=('custom:Gleez CMS License')
depends=('gleez')
options=('emptydirs')
install="${pkgname}.install"
source=("https://github.com/sergeyklay/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('620b5cae4b72a5a260bd754d317a578d')

build() {
    /bin/true
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -d -m 644 "${pkgdir}/usr/share/webapps/gleez/themes/cerber" || return 1
	cp -r * "${pkgdir}/usr/share/webapps/gleez/themes/cerber"
}
