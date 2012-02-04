# Maintainer: Olivier Mangin
pkgname=scikits-talkbox
pkgver=0.2.5
pkgrel=1
pkgdesc="Talkbox, a set of python modules for speech/signal processing."
arch=('i686' 'x86_64')
url="http://scikits.appspot.com/talkbox"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy' 'scikits-base')
makedepends=('python2-distribute' 'gcc')
options=(!emptydirs)

source=("http://pypi.python.org/packages/source/s/scikits.talkbox/scikits.talkbox-${pkgver}.tar.gz")
md5sums=('8d64926345608ed4721bed7e92db2ae8')

build() {
  cd "$srcdir/scikits.talkbox-${pkgver}"

  python2 setup.py install --root="$pkgdir"/ || return 1
  rm "$pkgdir/`python2 -c 'from distutils.sysconfig import get_python_lib; \
    print get_python_lib()'`/scikits/__init__.py"
}
