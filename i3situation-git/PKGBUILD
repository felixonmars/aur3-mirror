# Maintainer: Harvey Hunt <harveyhuntnexus@gmail.com>
_pkgname=i3situation
pkgname=$_pkgname-git
pkgver=1.0.0.r2.g1bd3912
pkgrel=1
pkgdesc="A pure Python 3 replacement for i3status, with support for massive customisation through plugins."
arch=(any)
url="https://github.com/HarveyHunt/i3situation"
license=('GPL3')
groups=()
depends=('python' 'python-requests')
makedepends=('git' 'python-setuptools' )
provides=($_pkgname)
conflicts=($_pkgname)
replaces=()
backup=()
options=(!emptydirs)
install=
source=($_pkgname::git://github.com/HarveyHunt/i3situation.git)
md5sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
