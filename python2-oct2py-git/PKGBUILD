# Maintainer: David Verelst <david point verelst at gmail dot com>

pkgname=python2-oct2py-git
_gitname=oct2py
pkgver=408.920db2b
pkgrel=1
pkgdesc="Python to GNU Octave bridge"
arch=(any)
url="https://github.com/blink1073/oct2py"
license=('MIT')
depends=('python>=2.6' 'octave' 'python2-scipy' 'python2-numpy')
makedepends=('python-distribute' 'octave')
optdepends=('python2-pexpect: prevent syntax errors from closing the Octave
session')
provides=(python2-oct2py)
conflicts=(python2-oct2py)
replaces=()
backup=()
options=(!emptydirs)
source=('git://github.com/blink1073/oct2py.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  #git describe --always | sed 's|-|.|g'
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
   cd $_gitname
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
