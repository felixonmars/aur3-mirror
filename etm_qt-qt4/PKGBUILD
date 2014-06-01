# Maintainer:  trashstar <trash@ps3zone.org>

pkgname=etm_qt-qt4
pkgver=2.3.27
pkgrel=2
pkgdesc="Manage events and tasks using simple text files."
arch=('any')
url="http://people.duke.edu/~dgraham/etmqt/"
license=('GPL')
depends=('python-pyqt4' 'python-dateutil' 'python-yaml')
optdepends=('python-icalendar: iCalendar support')
conflicts=('etm_qt')
makedepends=('python-setuptools')
source=("http://people.duke.edu/~dgraham/etmqt/etm_qt-$pkgver.tar.gz")
md5sums=('09d48fc81850ce77b9fe73540d3f664d')

package() {
    cd "$srcdir/etm_qt-$pkgver"
    python setup.py install --prefix=/usr --root=$pkgdir 
}
