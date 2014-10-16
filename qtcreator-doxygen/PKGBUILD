# Maintainer: Pierre-Antoine Rault <par at rigelk dot eu>

pkgname=qtcreator-doxygen
pkgver=0.3.9
pkgrel=1
pkgdesc="Simple QtCreator plugin that inserts Doxygen tags in source code and handles interaction with Doxygen binaries."
md5sums=()
arch=('i686' 'x86_64')
case "$CARCH" in
    i686) _pkgarch="x86"
          md5sums+=('3f312444f80b9ab29de3a16f99bc2b9e')
          ;;
    x86_64) _pkgarch="x86_64"
            md5sums+=('a0ec749168c7125567cf6b7849d80e68')
            ;;
esac
url="http://dev.kofee.org/projects/qtcreator-doxygen/wiki"
license=('LGPL')
depends=('qtcreator>=3.1.0' 'qtcreator<3.2.0')
source=("http://dev.kofee.org/attachments/download/81/${pkgname}-${pkgver}-qtcreator-3.1.x-linux-${_pkgarch}.tar.gz")
package() {
	cd "$srcdir/Kofee"
	install -d -m 755 $pkgdir/usr/lib/qtcreator/plugins/Doxygen
	install -D -m 644 libDoxygen.so $pkgdir/usr/lib/qtcreator/plugins/Doxygen/libDoxygen.so
	install -D -m 644 Doxygen.pluginspec $pkgdir/usr/lib/qtcreator/plugins/Doxygen/Doxygen.pluginspec
}
