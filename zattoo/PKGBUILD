# Contributor : TuxSpirit <tuxspiritATarchlinuxDOTfr>
## Contributor: Benjamin Stier <bs@kniegeil.de>
## Contributor: Christoph Siegenthaler <csi@gmx.ch>
## Contributor: bugix
## Contributor: Roberto Barreda 
## Contributor: Jens Maucher <defcon@archlinux.us>
pkgname=zattoo
pkgver=4.0.5
pkgrel=2
pkgdesc="Watch television over your broadband Internet connection  (account required, registration on http://zattoo.com)"
arch=('i686' 'x86_64')
url="http://zattoo.com/"
license=('custom')
depends=('flashplugin' 'qt4')
provides=('zattoo')
conflicts=('zattoo-ch' 'zattoo4' 'zattoo-beta')
install=zattoo.install
source=(http://download.zattoo.com/${pkgname}-${pkgver}-i386.deb \
        License.txt)

md5sums=('5fc6e9bebebf7b990ce0b37ea73fca60'
         'bfd7fe899abba912128021bb42803e20')

package() {

        # License
	install -D -m 0644 ${srcdir}/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	cd ${srcdir}
	# DEB ressources
        bsdtar xf ${pkgname}-${pkgver}-i386.deb
	# TAR ressources
	bsdtar xf data.tar.gz -C ${pkgdir}

        # Symbolic
        cd ${pkgdir}/usr/bin
        ln -s Zattoo zattoo

        # Remove libQt - hagabaka 
        rm ${pkgdir}/usr/lib/zattoo/libQt*  
       
}
