# Maintainer: Pierre Carru <pierre.carru@gmail.com>
pkgname=kpatch-git
pkgver=20130319
pkgrel=1
pkgdesc='dynamic kernel patching'
arch=('i686' 'x86_64')
url="https://github.com/dynup/kpatch"
license=('GPL2')
depends=()
makedepends=()

source=('git://github.com/dynup/kpatch.git')
md5sums=('SKIP')

_gitname='kpatch'

build() {
    cd $_gitname

    make
}

package() {
    cd $_gitname
    make install PREFIX="$pkgdir/opt/kpatch"
}

