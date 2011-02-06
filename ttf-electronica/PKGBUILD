# Contributor: Bernardo Barros <bernardobarros@gmail.com>
pkgname='ttf-electronica'
pkgver=1
pkgrel=1
pkgdesc="Music Symbols Font"
arch=('any')
url="http://christian.texier.pagespro-orange.fr/"
license=('GPL')
depends=('fontconfig')
install='font-ttf.install'
source=("http://christian.texier.pagespro-orange.fr/mididesi/free/media/electronica.zip")
md5sums=('f08a0205f9e17fe98dfebdd6796716be')
build()
{
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/fonts/TTF"
	cp ELECTRON.TTF "${pkgdir}/usr/share/fonts/TTF"
}

