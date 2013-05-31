pkgname=diffutils-git
_pkgname=diffutils
pkgver=v3.3.8.gd1d1df8
pkgrel=1
pkgdesc="Utility programs used for creating patch files"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/diffutils"
license=('GPL3')
groups=('base')
depends=('glibc' 'sh')
makedepends=('git')
install=diffutils.install

source=('git://git.savannah.gnu.org/diffutils.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./bootstrap
    git submodule foreach git pull origin master
    ./configure --prefix=/usr
    make
}

check() {
    cd "${srcdir}/${_pkgname}"
    make check || true
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
