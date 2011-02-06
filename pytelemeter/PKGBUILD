# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=pytelemeter
pkgver=1.5
pkgrel=4
pkgdesc="Python utility to check used and remaining Telenet traffic"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pytelemeter//"
install="pytelemeter.install"
license=('GPL2')
depends=('python2' 'python-soappy')
optdepends=('pygtk: GTK interface'
	    'python-gnome-extras: GTK tray icon')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_${pkgver}.tar.gz
	pytelemeter-1.5.patch)
sha256sums=('2cd8096bc951db99c24f2bfbdffe872acf44f001998d422ac7589e669d0ddaed'
            '7bc3c0a9350b5802550affc37daa99694c81f8452b96d794caaf080270915df8')

build() {
	cd ${pkgname}-${pkgver}
	# Adapt to the latest interface of Telenet's service
	patch -Np1 -i $srcdir/${source[1]}
	# Install
	python2 setup.py install --prefix=/usr --root="$pkgdir"
	install -vm 660 ${srcdir}/${pkgname}-${pkgver}/pytelemeterrc ${pkgdir}/usr/share/pytelemeter/pytelemeterrc
}
