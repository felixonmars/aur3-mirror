# Maintainer: Igor Babuschkin <ibabuschkin at gmail dot com>

pkgname=python2-llvmpy-git
pkgver=20140428.g7af2f71
pkgrel=1
pkgdesc="Python Bindings for LLVM"
url="http://www.llvmpy.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('llvm' 'python2')
makedepends=(git)
provides=('python2-llvmpy')
conflicts=()
source=(git+https://github.com/llvmpy/llvmpy.git#branch=llvm-3.4)
md5sums=('SKIP')

_gitname=llvmpy

pkgver() {
    cd $_gitname
    git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
}

package() {
  cd ${_gitname}

  python2 setup.py install \
    --prefix=/usr \
    --root="$pkgdir"/
}
