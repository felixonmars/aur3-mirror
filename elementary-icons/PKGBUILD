# Mantainer: Diego Principe <cdprincipe@at@gmail@dot@com>
# Contributor: paterbrown <paterbrown at silberhelme dot de>
# Contributor: Josip <josipponjavic at gmail dot com>

pkgname=elementary-icons
_pkgname=elementary-icon-theme
pkgver=3.0
pkgrel=1
pkgdesc="icon theme designed to be smooth, sexy, clear, and efficient."
arch=('any')
url="https://launchpad.net/elementaryicons"
license=('GPL3')
depends=('librsvg')
source=("$pkgname-$pkgver.tar.gz"::"http://launchpad.net/elementaryicons/3.x/${pkgver}/+download/elementary.tar.gz")
md5sums=('7c74684926cfbf58782948d4dc8c79f6')

package() {
	cd ${srcdir}/elementary
	mkdir -p ${pkgdir}/usr/share/icons
	cp -r ${srcdir}/elementary ${pkgdir}/usr/share/icons

}

