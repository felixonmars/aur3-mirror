# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-pyqt
pkgver=4.8.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="PyQt: A set of Python2 bindings for the Qt toolkit"
url="http://www.riverbankcomputing.co.uk/software/pyqt"
license=('GPL')
depends=('dbus-python' 'python26-sip')
makedepends=('qt' 'phonon' 'qt-assistant-compat' 'python26-opengl')
source=("http://riverbankcomputing.co.uk/static/Downloads/PyQt4/PyQt-x11-gpl-$pkgver.tar.gz")
md5sums=('0e4264bb912edfbda319bb236ac84407')

build() {
 cd "$srcdir/PyQt-x11-gpl-$pkgver"
 python26 configure.py --confirm-license -v /usr/share/sip --qsci-api
 find -name 'Makefile' | xargs sed -i 's|-Wl,-rpath,/usr/lib||g;s|-Wl,-rpath,.* ||g'
 make
}

package() {
 cd "$srcdir/PyQt-x11-gpl-$pkgver"
 make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install
 rm -rv "$pkgdir"/usr/{bin,lib/qt/plugins/designer/libpythonplugin.so,share/qt/qsci/api/python/PyQt4.api}
}
