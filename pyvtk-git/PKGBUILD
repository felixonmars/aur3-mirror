# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=pyvtk-git
pkgver=20140411
pkgrel=2
pkgdesc="tools for manipulating VTK files in Python, git version"
arch=('any')
url="https://code.google.com/p/pyvtk"
license=('GPL')
depends=('python2')
makedepends=('git')
provides=('pyvtk')
conflicts=('pyvtk')
source=('git+https://code.google.com/p/pyvtk')
md5sums=('SKIP')

# Git variable.
_gitname=pyvtk

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
    cd "$srcdir/$_gitname"

    python2 setup.py build
    python2 setup.py install --root=$pkgdir
}
