# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: mmm
pkgname=tulpenmanie-git
pkgver=20130314
pkgrel=2
pkgdesc="GUI for trading bitcoins and other currencies at various markets (MtGox,btc-e,VirWox)"
arch=('any')
url="https://github.com/redcomet/tulpenmanie.git"
license=('GPL')
depends=('python2>=2.7' 'python2-pyqt>=4' )
makedepends=('git')
provides=('tulpenmanie')
conflicts=('tulpenmanie')
options=(!emptydirs)
md5sums=('SKIP')
source=('git+git://github.com/redcomet/tulpenmanie.git')
_gitname=tulpenmanie

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
