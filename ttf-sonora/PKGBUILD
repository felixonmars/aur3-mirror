# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname='ttf-sonora'
pkgver=1
pkgrel=1
pkgdesc="Sonora Music Font"
arch=('any')
url="http://christian.texier.pagespro-orange.fr/"
license=('GPL')
depends=('fontconfig')
source=("http://christian.texier.pagespro-orange.fr/mididesi/free/media/sonora.zip")
md5sums=('2bd49fda45aa360ade4f5c54a01e863b')
build()
{
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/fonts/TTF"
	cp SONORA.TTF "${pkgdir}/usr/share/fonts/TTF"
}

