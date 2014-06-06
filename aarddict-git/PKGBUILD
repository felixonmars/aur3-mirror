# Maintainer: Christophe Calves <calves@crans.org>
pkgname=aarddict-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Aard Dictionary is a multiplatform dictionary and offline Wikipedia reader compatible with FBReader and CoolReader."
arch=('any')
url="http://aarddict.org"
license=('GPL3')
groups=()
depends=('python2' 'python2-pyicu' 'python2-simplejson' 'hicolor-icon-theme' 'python2-setuptools' 'python2-pyqt4')
makedepends=('git')
provides=('aarddict')
conflicts=('aarddict')
replaces=('aarddict')
backup=()
options=(!emptydirs)
install=
source=("$pkgname"::'git://github.com/aarddict/desktop.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et: