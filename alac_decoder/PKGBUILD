# Maintainer:   Nyarcel              <nyarcel AT SPAMFREE gmail DOT com>
# Contributor:  Filip Wojciechowski  <filip AT SPAMFREE loka DOT pl>
# Contributor:  Shinlun Hsieh        <yngwiexx AT SPAMFREE yahoo DOT com DOT tw>
# Contributor:  William Rea          <sillywilly AT SPAMFREE gmail DOT com>
#
# PKGBUILD revision: 2013-12-21

pkgname=alac_decoder
pkgver=0.2.0
pkgrel=2
pkgdesc="A basic decoder for Apple Lossless Audio Codec (ALAC) files"
arch=('i686' 'x86_64')
url="http://craz.net/programs/itunes/alac.html"
license=('MIT')
depends=('glibc')
source=(http://craz.net/programs/itunes/files/${pkgname}-${pkgver}.tgz
        MIT-LICENSE)
md5sums=('cec75c35f010d36e7bed91935b57f2d1'
         'fe0f525ad579bf624ee9982d38b4d440')

build() {
	cd ${srcdir}/${pkgname}
	echo "Building from sources..."
	make
}

package() {
	echo "Installing alac..."
	install -D -m755 ${srcdir}/${pkgname}/alac ${pkgdir}/usr/bin/alac
	echo "Installing license..."
	install -D -m644 ${srcdir}/MIT-LICENSE \
	                 ${pkgdir}/usr/share/licenses/${pkgname}/MIT-LICENSE
}
