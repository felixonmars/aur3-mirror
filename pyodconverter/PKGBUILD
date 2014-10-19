# Contributor: Todd Harbour <aur @AT@ quadronyx .DOT. org>

pkgname=pyodconverter
pkgver=1.2
pkgrel=1
pkgdesc="OpenDocument command line converter - similar to JODConverter but simpler."
url="http://www.artofsolving.com/opensource/pyodconverter"
arch=("any")
license=("LGPL")
depends=('python2' 'libreoffice-still-common')
source=("pyodconverter"
	"https://github.com/mirkonasato/$pkgname/raw/master/DocumentConverter.py")
md5sums=('41f9924ec8ccc4e1eda8befb8cb34e45'
         'a5fd0f4f89894b2e905649af644970de')


package() {
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/bin/
	install -m644 DocumentConverter.py ${pkgdir}/usr/bin/PyODConverter.py
	install -m755 pyodconverter ${pkgdir}/usr/bin/
	#ln -s PyODConverter.py ${pkgdir}/usr/bin/${pkgname}
}
