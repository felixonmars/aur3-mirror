# Contributor: Bernardo Barros <bernardobarros@gmail.com>
pkgname='ttf-controla'
pkgver=1
pkgrel=1
pkgdesc="Cntrola Music Symbols Font (TTF)"
arch=('any')
url="http://christian.texier.pagespro-orange.fr/"
license=('GPL')
depends=('fontconfig')
install='controla-font-ttf.install'
source=("http://christian.texier.pagespro-orange.fr/mididesi/free/media/controla.zip")
md5sums=('1e87e562175efe9c04100e50b98abe38')
build()
{
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/fonts/TTF"
	cp CONTROLA.TTF "${pkgdir}/usr/share/fonts/TTF"
}
