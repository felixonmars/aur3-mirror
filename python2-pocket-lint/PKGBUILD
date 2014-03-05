pkgname=python2-pocket-lint
pkgdesc="Pocket-lint is a composite linter and style checker for source code."
pkgver=1.4.0
pkgrel=1
url="https://launchpad.net/Pocket-lint"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2')
source=("http://launchpad.net/pocket-lint/trunk/${pkgver}/+download/pocketlint-${pkgver}.tar.gz")
md5sums=(17847dd13b1c0ce5259b8b4335f6b3e0'')

build(){
    cd $srcdir/pocketlint-${pkgver}/
    python2 setup.py build
    python2 setup.py install --root=$pkgdir --optimize=1
}
