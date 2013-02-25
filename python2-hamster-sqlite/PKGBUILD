# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python2-hamster-sqlite
pkgver=0.3
pkgrel=1    # XXX don't forget to reset
pkgdesc="The sqlite backend of hamster time tracker"
arch=(any)
url="https://github.com/projecthamster/hamster"
license=('GPL')
depends=('python2>=2.6')
makedepends=('python2-distribute')
optdepends=(
    'python2-xdg: for XDG support'
    'python2-gobject: for file monitoring'
)
provides=()
conflicts=('hamster-time-tracker')
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/h/hamster-sqlite/hamster-sqlite-${pkgver}.tar.gz)
md5sums=('18b3c593308f33129c779e649c188b8d')

build() {
   cd "${srcdir}/hamster-sqlite-${pkgver}"
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
