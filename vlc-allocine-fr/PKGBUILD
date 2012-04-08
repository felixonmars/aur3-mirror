# Contributor: casa 


basename=vlc
extname=allocine-fr
pkgname=${basename}-${extname}
pkgver=0.1
pkgrel=1
pkgdesc="Fetches information on current media playing from Allocine.fr"
arch=("any")
url="http://addons.videolan.org/content/show.php/Allociné+(french)?content=148709"
license=("GPL")
depends=("${basename}" lua)
options=(!emptydirs)
source=(http://addons.videolan.org/CONTENT/content-files/148709-${extname}.lua)

package() {
	cd "${srcdir}"
	
	install -Dm64 148709-${extname}.lua ${pkgdir}/usr/lib/${basename}/lua/extensions/${extname}.lua
}

sha1sums=('2c67e8067332a68efb7ea37497afc7fee19cb0e5')
