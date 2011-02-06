# Contributor: Emanuele Cipolla <mail@emanuelecipolla.net>

pkgname=python-lanyon
pkgver=6
pkgrel=1
pkgdesc="static site generator (stable release)"
license=("BSD")
url="http://github.com/arthurk/lanyon"
depends=('python2' 'python-jinja2' 'python-pigment-svn')
optdepends=('python-markdown')
source=(http://pypi.python.org/packages/source/l/lanyon/lanyon-$pkgver.tar.gz)
arch=('i686' 'x86_64')
md5sums=('3c8b72677669e7a01b1452923fb89c65')

build() {
  cd ${srcdir}/lanyon-${pkgver}
  python setup.py install --root=$startdir/pkg --optimize=1 || return 
}

