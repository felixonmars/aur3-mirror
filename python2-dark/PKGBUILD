# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python2-dark
pkgver=0.7.1
pkgrel=1
pkgdesc="Data Analysis and Reporting Kit (DARK)"
arch=(any)
url="http://bitbucket.org/neithere/dark/"
license=('LGPL3')
depends=('python2>=2.5' 'python2-doqu')
makedepends=('python2-distribute')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/d/dark/dark-${pkgver}.tar.gz)
md5sums=('27d490d586d45eb382eb70cbf0ecae5d')

build() {
   cd "${srcdir}/dark-${pkgver}"
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
