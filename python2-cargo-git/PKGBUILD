pkgname=python2-cargo-git
pkgver=20130311
pkgrel=1
pkgdesc="borg general support modules"
arch=('i686' 'x86_64')
url="https://github.com/borg-project/cargo"
license=('MIT')
depends=('python2' 'cython2' 'python2-numpy')
makedepends=('git' 'waf')
conflicts=('python2-cargo')
provides=('python2-cargo')

source=('git://github.com/borg-project/cargo.git')
md5sums=('SKIP')

build() {
    cd "cargo"

    PYTHON=python2 python2 waf configure
    PYTHON=python2 python2 waf build
}

package() {
    cd "cargo"

    DESTDIR="$pkgdir" PYTHON=python2 python2 waf install
}
