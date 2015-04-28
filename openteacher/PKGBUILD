# Contributor: Cyberpunk <apocalipsisfull-2011@outlook.com>
# Maintainer: Cyberpunk <apocalipsisfull-2011@outlook.com>

pkgname=openteacher
pkgver=3.2
pkgrel=2
pkgdesc="Is an opensource application that helps you learn a variety of subjects."
arch=('any')
url="http://openteacher.org/"
license=('GPL')
depends=('python2' 'python2-pyqt4' 'phonon-qt4')
source=('http://sourceforge.net/projects/openteacher/files/openteacher/3.2/openteacher_3.2_linux.tar.gz')
sha256sums=('f8fcfdd877c5adbe79b2cc75bf8bea2adc8aa9d09e90702d6f3bedee0b83050b')

package() {
    cd "$srcdir/"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
