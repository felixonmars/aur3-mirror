# Maintainer: Sander Boom <sander@inflowmotion.nl>

pkgname=ansible-lint
pkgver=2.0.1
pkgrel=1
pkgdesc="checks playbooks for practices and behaviour that could potentially be improved"
url="https://github.com/willthames/ansible-lint"
depends=('python2' 'ansible')
makedepends=('python2-distribute' )
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/source/a/ansible-lint/ansible-lint-2.0.1.tar.gz')
md5sums=('2f43dec6f6ef148c6620fe5ad349a845')

build() {
    cd $srcdir/ansible-lint-2.0.1
    python2 setup.py build
}

package() {
    cd $srcdir/ansible-lint-2.0.1
    python2 setup.py install --root="$pkgdir" --optimize=1
}
