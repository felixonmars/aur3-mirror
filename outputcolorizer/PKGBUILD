# Maintainer: ybznek

pkgname="outputcolorizer"
pkgver=20150305beta
pkgrel=4
pkgdesc="Create colored output from stdin. colorize --help"
arch=('i686' 'x86_64')
url="http://zbynek.php5.cz"
depends=('ruby')
license=('GPL2')
source=("colorize.rb")
 
package() {
	install -m755 -d ${pkgdir}/usr/bin
	cp ./colorize.rb ${pkgdir}/usr/bin/colorize
	chmod 775 ${pkgdir}/usr/bin/colorize

}

md5sums=('8c4cbe5da8475db539dab9b41541cc02')
