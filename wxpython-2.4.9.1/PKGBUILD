# Maintainer: solusipse <arch@solusipse.net>

pkgname=wxpython-2.4.9.1
pkgver=2.9.4.1
pkgrel=1
pkgdesc="A wxWidgets GUI toolkit for Python (development release)"
arch=('any')
url="http://www.wxpython.org"
license=('custom: wxWindows')
depends=('wxgtk' 'python2' 'webkitgtk2')
makedepends=('mesa')

source=(http://downloads.sourceforge.net/project/wxpython/wxPython/2.9.4.0/wxPython-src-2.9.4.0.tar.bz2
        http://downloads.sourceforge.net/project/wxpython/wxPython/2.9.4.0/wxPython-src-2.9.4.1.patch)

md5sums=(
	'b058fd4363cf3a6da852dd8e65a3648d'
	'bb5eaec96e44544aaf42538573a207ab'
)

build() {
	
	cd ${srcdir}
	patch -p 0 -d wxPython-src-2.9.4.0/ < wxPython-src-${pkgver}.patch
	cd wxPython-src-2.9.4.0/wxPython
	python2 build-wxpython.py --build_dir=../bld

}

package() {
	
	cd "${srcdir}/wxPython-src-2.9.4.0/wxPython"
	python2 setup.py install --root="${pkgdir}"
	cp -P ../bld/lib/libwx_*.so.4.0.0 "${pkgdir}/usr/lib"
	install -D -m644 ../docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 ../docs/preamble.txt "${pkgdir}/usr/share/licenses/${pkgname}/PREAMBLE"
	install -D -m644 ../docs/gpl.txt "${pkgdir}/usr/share/licenses/${pkgname}/GPL"
	install -D -m644 ../docs/lgpl.txt "${pkgdir}/usr/share/licenses/${pkgname}/LGPL"
	install -D -m644 ../docs/licendoc.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENDOC"

}