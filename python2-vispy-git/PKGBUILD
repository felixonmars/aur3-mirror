# Maintainer: David Verelst <david dot verelst at gmail com>
pkgname=python2-vispy-git
_gitname=vispy
pkgver=1016.6b1c6c3
pkgrel=1
pkgdesc="Vispy is an OpenGL-based interactive visualization library in Python"
arch=('i686' 'x86_64')
url="http://vispy.org/"
license=('BSD')
depends=('python2-numpy' 'python2-opengl')
provides=('python2-vispy')
conflicts=('python2-vispy')
makedepends=()
optdepends=()
options=(!emptydirs)
source=('git://github.com/vispy/vispy.git')
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


