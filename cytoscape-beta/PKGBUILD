# Contributor: alyst <astukalov@gmail.com>

pkgname=cytoscape-beta
pkgver=3.0.0_beta1
# package version as it appears in the name of tar.gz archive file
_pkgver=${pkgver//_beta/-beta}
pkgrel=2
pkgdesc='A software for visualizing molecular interaction networks and integration with gene expression profiles and other state data. Beta series'
arch=('i686' 'x86_64')
url=http://www.cytoscape.org
license=('LGPL2')
depends=('java-runtime')
install='cytoscape-beta.install'
source=("http://chianti.ucsd.edu/cytoscape-$_pkgver/cytoscape-$_pkgver.tar.gz"
	'cytoscape-beta.desktop'
	'cytoscape-beta.png')

md5sums=('f811f54aa7e9efe5e9625b29672db41b'
         'a67db805e57441422a8691572953b183'
         'bf4413720a76cf767cc612d657dd1661')

build() {
	cd ${srcdir}/cytoscape-unix-${_pkgver}
	./gen_vmoptions.sh
}

package() {
	install -d ${pkgdir}/opt/cytoscape-beta/
	install -d ${pkgdir}/usr/share/{applications,pixmaps}
#	install -d ${pkgdir}/usr/bin

	cd ${startdir}/

	cp -r ${srcdir}/cytoscape-unix-${_pkgver}/* ${pkgdir}/opt/cytoscape-beta/
	install -D -m644  cytoscape-beta.png ${pkgdir}/usr/share/pixmaps
	install -D -m644  cytoscape-beta.desktop ${pkgdir}/usr/share/applications
}

