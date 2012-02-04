# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_slim_theme
pkgver=0.2.1
pkgrel=2
pkgdesc="Openarch slim theme"
arch=('any')
groups=('openarch_gray')
url="http://box-look.org/"
license=('GPL')
depends=('slim' 'openarch_fonts')
source=("http://dl.dropbox.com/u/19256622/src/$pkgname/openarch-gray.tar.gz")


build() {
	cd "${srsdir}"
	install -d -m755 "${pkgdir}"/usr/share/slim/themes/openarch-gray/
	install -m644 "${srcdir}"/openarch-gray/* "${pkgdir}"/usr/share/slim/themes/openarch-gray/
}
md5sums=('4d133e44bd4554af5a2807e87c3e69d3')
md5sums=('52bc9631f57fe3a144985f890a536c9d')
