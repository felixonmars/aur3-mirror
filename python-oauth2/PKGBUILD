
pkgname=python-oauth2
realname=python-oauth2
abbreviation=oauth2
pkgver=1.2.0
pkgrel=2
pkgdesc="A fully tested, abstract interface to creating OAuth clients and servers."
arch=(any)
url="http://pypi.python.org/pypi/oauth2/"
depends=('python>=2.6' 'setuptools')
conflicts=('key-status-monitro')
makedepends=()
optdepends=()
license=('MIT')
source=("http://pypi.python.org/packages/source/o/${abbreviation}/${abbreviation}-${pkgver}.tar.gz")
md5sums=("42b41a74632ccceb6094b5c232f3efec")

build() {
  cd $startdir/src/$abbreviation-$pkgver
  python2 setup.py install --root=$startdir/pkg || return 1
}



