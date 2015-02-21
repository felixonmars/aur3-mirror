# Maintainer: Sander Boom <sander@inflowmotion.nl>

pkgname=ansible-lint
pkgver=2.0.3
pkgrel=1
pkgdesc="checks playbooks for practices and behaviour that could potentially be improved"
url="https://github.com/willthames/ansible-lint"
depends=('python2' 'ansible')
makedepends=('python2-distribute' )
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/a/ansible-lint/ansible-lint-${pkgver}.tar.gz")
md5sums=('7cf9924229c14f960ea4953d356258e1')

build() {
    cd $srcdir/ansible-lint-${pkgver}
    python2 setup.py build
}

package() {
    cd $srcdir/ansible-lint-${pkgver}
    python2 setup.py install --root="$pkgdir" --optimize=1
}
