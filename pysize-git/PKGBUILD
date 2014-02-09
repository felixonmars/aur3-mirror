# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Thomas Schreck <shrek@axolotlfarm.org>

pkgname=pysize-git
pkgver=0.2.r95.g01dadd7
pkgrel=1
pkgdesc="A graphical and console tool for exploring the size of directories (development version)"
arch=('any')
url="http://guichaz.free.fr/pysize/"
license=('GPL2')
depends=('pygtk')
source=(pysize::"git+http://repo.or.cz/r/pysize.git")
md5sums=('SKIP')

pkgver() {
  cd pysize
  git describe --long --tags | sed -r 's/^pysize-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  # disable old setuptools
  sed "s|^sys.path.insert(0, 'setuptools|#&|" -i pysize/setup.py
}

package() {
  cd pysize

  python2 setup.py install --root="$pkgdir" --optimize=1
}
