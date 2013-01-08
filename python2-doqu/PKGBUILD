# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python2-doqu
pkgver=0.28.2
pkgrel=1
pkgdesc="Document-query: models for schema-less databases."
arch=(any)
url="http://bitbucket.org/neithere/doqu/"
license=('LGPL3')
depends=('python2>=2.6')
makedepends=('python2-distribute')
optdepends=(
    'python-wtforms: form generation support'
    'python2-pymongo: MongoDB support'
)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/d/doqu/doqu-${pkgver}.tar.gz)
md5sums=('d239797d1cfab95b7a769a47c62b5e02')

build() {
   cd "${srcdir}/doqu-${pkgver}"
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
