# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python2-timetra
pkgver=0.1.0
pkgrel=1
pkgdesc="a time tracking application and library"
arch=(any)
url="http://bitbucket.org/timetra/timetra"
license=('GPL')
depends=('python2>=2.6' 'python2-argh>=0.22' 'python2-hamster-sqlite>=0.2')
makedepends=('python2-distribute')
optdepends=(
    'python2-urwid: for curses UI'
    'python2-flask: for web UI'
    'python2-wtforms: for web UI'
)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/t/timetra/timetra-${pkgver}.tar.gz)
md5sums=('4fe5723278e40aa7b4de03b4fc97f46a')

build() {
   cd "${srcdir}/timetra-${pkgver}"
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
