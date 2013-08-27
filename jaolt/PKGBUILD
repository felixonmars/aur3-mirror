# Contributor: Max Roder <maxroder@web.de>

pkgname=jaolt
pkgver=0.6.12
pkgrel=1
pkgdesc='Java auction management tool for ebay, auvito and hood'
arch=('any')
url='http://code.google.com/p/jaolt/'
license=('LGPL' 'CDDL'  'APACHE' 'BSD' 'CCPL:by')
depends=('java-environment' 'bash')
conflicts=('jaolt-svn')
source=("http://jaolt.googlecode.com/files/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('d04cee51a0864c12c96398f8d3e892c05b14dfd5669ea7469601f2c8b277d64c')


package() {
	cd ${srcdir}/${pkgname}_${pkgver}-orig

	# Install bin
	install -Dm755 jaolt ${pkgdir}/usr/bin/jaolt

	# Copy license files
	install -d ${pkgdir}/usr/share/licenses/jaolt
	mv license-instructions.txt ${pkgdir}/usr/share/licenses/jaolt/readme

	# Desktop stuff
	install -d ${pkgdir}/usr/share/java/jaolt/ ${pkgdir}/usr/share/applications/ ${pkgdir}/usr/share/pixmaps/
	mv jaolt.desktop ${pkgdir}/usr/share/applications/
	mv jaolt.xpm ${pkgdir}/usr/share/pixmaps/
	
	# Remove unnecessary files, copy anything else
	rm -rf build.xml lgpl.txt INSTALLING jaolt
	cp -r * ${pkgdir}/usr/share/java/jaolt/
}

# vim:set ts=2 sw=2 et:
