# Maintainer: Jose M. Dana

pkgname=cmpcfg
pypiname=cmpcfg
pkgver=0.5.9
pkgrel=1
pkgdesc="Compares configuration files ignoring comments."
arch=(any)
url="https://github.com/jmdana/cmpcfg"
license=('GPL')
groups=()
depends=("python")
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/c/cmpcfg/cmpcfg-$pkgver.tar.gz")
md5sums=("5ca7c15792f46653da48977dc6becf7e")

package() {
  cd "$srcdir/$pypiname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
