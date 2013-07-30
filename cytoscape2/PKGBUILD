# Contributor: florianbw <florian.bw@gmail.com>

pkgname=cytoscape2
pkgver=2.8.3
_pkgver=2_8_3
pkgrel=1
pkgdesc='A software for visualizing molecular interaction networks and integration with gene expression profiles and other state data. Version 2.8.'
arch=('i686' 'x86_64')
url=http://www.cytoscape.org
license=('LGPL2')
depends=('java-runtime')
source=("http://chianti.ucsd.edu/Cyto-$_pkgver/cytoscape-$pkgver.tar.gz" \
	'cytoscape2.desktop' \
	'cytoscape2.png' \
	'cytoscape2')

package() {

	install -d ${pkgdir}/opt/cytoscape2
	install -d ${pkgdir}/opt/cytoscape2/framework/instances
	install -d ${pkgdir}/usr/share/{applications,pixmaps}
	install -d ${pkgdir}/usr/bin

	cd ${startdir}/

	cp -r ${srcdir}/cytoscape-${pkgver}/* ${pkgdir}/opt/cytoscape2
	chmod 755 ${pkgdir}/opt/cytoscape2/cytoscape.sh 
	install -D -m755  cytoscape2 ${pkgdir}/usr/bin/
	install -D -m644  cytoscape2.png ${pkgdir}/usr/share/pixmaps
	install -D -m644  cytoscape2.desktop ${pkgdir}/usr/share/applications
}

md5sums=('1301aad2c0e8106899a9f4bea2fff2f9'
         '4fe56b68306a98fd2bc9f29904ea13c2'
         'b579b3650a136e999307c99a844e628a'
         '130b0486b8dd7d5ddd5f1e9298cfe7c8')
