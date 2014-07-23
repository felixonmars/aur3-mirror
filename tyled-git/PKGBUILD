# Maintainer: Harvey Hunt <harveyhuntnexus@gmail.com>
_pkgname=tyled
pkgname=$_pkgname-git
pkgver=
pkgrel=1
pkgdesc="A lightweight image tiler and mosaic maker, useful for wallpapers"
arch=(any)
url="https://github.com/HarveyHunt/tyled"
license=('GPL3')
groups=()
depends=('python' 'python-pillow')
makedepends=('git' 'python-setuptools' )
provides=($_pkgname)
conflicts=($_pkgname)
replaces=()
backup=()
options=(!emptydirs)
install=
source=($_pkgname::git://github.com/HarveyHunt/tyled.git)
md5sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
