# Contributor: Bernardo Barros <bernardobarros@gmail.com>
pkgname='ttf-concreta'
pkgver=1
pkgrel=1
pkgdesc="Concreta Symbols Font (TTF)"
arch=('any')
url="http://christian.texier.pagespro-orange.fr/"
license=('GPL')
depends=('fontconfig')
source=("http://christian.texier.pagespro-orange.fr/mididesi/free/media/concreta.zip")
md5sums=('8030780fccd17340543d733678a2f01d ')
build()
{
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/fonts/TTF"
	cp CONCRETA.TTF "${pkgdir}/usr/share/fonts/TTF"
}

