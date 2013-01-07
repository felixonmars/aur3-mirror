# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python2-tool
pkgver=0.7.1
pkgrel=1
pkgdesc="A compact modular conf/web/console framework."
arch=(any)
url="http://bitbucket.org/neithere/tool/"
license=('LGPL3')
depends=(
    'python2-yaml'
    'python2-pydispatcher'
    'python2-argh>=0.2'
)
makedepends=('python2-distribute')
optdepends=(
    'python2-doqu: document-oriented DB support'
    'python2-werkzeug: web interface support'
    'python2-jinja: templating support'
    'python2-dark: data analysis & reporting support'
    'python2-repoze.who: authentication support'
    'python2-repoze.what: authorization support'
    'python2-storm: Storm ORM support'
    'python-sqlobject: SQLObject ORM support'
)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/t/tool/tool-${pkgver}.tar.gz)
md5sums=('b74999b5a5a7e80fbdad41977a0a2282')

build() {
   cd "${srcdir}/tool-${pkgver}"
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
