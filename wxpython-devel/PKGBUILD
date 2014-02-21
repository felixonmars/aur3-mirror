# Maintainer: Ronnie Andrew <ronnieandrew92 at gmail dot com>
# Original submitter: solusipse
# Revision by Rita Bylsma at solid state chemistry department of Radboud University Nijmegen, The 
Netherlands.
#
# This package will be installed as a newer version of wxpython,
# meaning that any older version will be removed, but it is easy to
# get the older version back.
# If you would want to have both versions installed at the same time,
# read the notes below.
#
# In case this program does not work properly after installation,
# also read the notes below.
# 
 
pkgname=wxpython-devel
pkgver=2.9.5.0
pkgrel=1
pkgdesc="A wxWidgets GUI toolkit for Python (development release)"
arch=('any')
url="http://www.wxpython.org"
license=('custom: wxWindows')
depends=( 'python2' 'webkitgtk2')
makedepends=('mesa')
 
source=(https://www.dropbox.com/s/09cmc6p7awqoyog/wxPython-src-2.9.5.0.tar.gz)
 
md5sums=('3de11d81ba5c8b4154ad75fdfe26dfbd'
)
 
build() {
	
	cd ${srcdir}
	cd wxPython-src-2.9.5.0/wxPython
	python2 build-wxpython.py --build_dir=../bld
        echo "We are now after the build, before the installation."
        echo "After installation, you will not have to set any environment variables."
        echo "In Arch Linux, use python2 demo/demo.py"
}
 
package() {
	
	cd "${srcdir}/wxPython-src-2.9.5.0/wxPython"
	python2 build-wxpython.py --install --installdir="${pkgdir}/opt/${pkgname}" 
--wxpy_installdir="${pkgdir}"
        echo "Contrary to what the script just told you, in Arch Linux use:"
        echo "python2 demo/demo.py"
        echo "Note that after installation, you will not need to set any environement variables."
	#cp -P ../bld/lib/libwx_*.so.4.0.0 "${pkgdir}/usr/lib"
	install -D -m644 ../docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 ../docs/preamble.txt "${pkgdir}/usr/share/licenses/${pkgname}/PREAMBLE"
	install -D -m644 ../docs/gpl.txt "${pkgdir}/usr/share/licenses/${pkgname}/GPL"
	install -D -m644 ../docs/lgpl.txt "${pkgdir}/usr/share/licenses/${pkgname}/LGPL"
	install -D -m644 ../docs/licendoc.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENDOC"
}
