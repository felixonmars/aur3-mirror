# Maintainer: Julien Humbert <julroy67 at gmail dot com>
# Contributor: Calimero

pkgname=ibus-tegaki
pkgver=0.3.1
pkgrel=4
pkgdesc='iBus integration for Tegaki handwriting recognition tool'
arch=('any')
url='http://www.tegaki.org/'
license=('GPL2')
depends=('python2' 'ibus>=1.2' 'tegaki-pygtk>=0.3' 'tegaki-recognize>=0.3')
source=("http://www.tegaki.org/releases/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('8f14bc60bee12c47e999df82f1256685')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python2 setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python2 setup.py install --prefix="${pkgdir}/usr" --optimize=1

	# fix references to $pkgdir and python executable name
	sed -i "s#${pkgdir}##;s#python#python2#" \
		"${pkgdir}/usr/share/ibus/component/tegaki.xml" \
		"${pkgdir}/usr/lib/ibus-tegaki/ibus-engine-tegaki"
}
