# Contributor: Bernardo Barros <bernardobarros@gmail.com>
pkgname='ttf-acoustica'
pkgver=1
pkgrel=1
pkgdesc="Acoustica Music Font (TTF)"
arch=('any')
url="http://christian.texier.pagespro-orange.fr/"
license=('GPL')
depends=('fontconfig')
source=("http://christian.texier.pagespro-orange.fr/mididesi/free/media/acoustica.zip")
md5sums=('3424157e3d0b6b5029795acd721b1b34 ')
build()
{
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/fonts/TTF"
	cp ACOUSTIC.TTF "${pkgdir}/usr/share/fonts/TTF"
}

