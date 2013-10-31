# Maintainer: Jan Oliver Oelerich <janoliver@oelerich.org> 

pkgname=inkscapeslide2-git
pkgdesc="Forked and improved version of inkscapeslide-git"
pkgver=ad1d818
pkgrel=1
arch=('i686' 'x86_64')
license=('mit')
depends=('python' 'python-pypdf2-git' 'inkscape' 'python-lxml')
makedepends=('git')
conflicts=('inkscapeslide-git')
url="https://github.com/janoliver/inkscapeslide2.git"
source=('git+https://github.com/janoliver/inkscapeslide2.git')
_gitname="inkscapeslide2"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always --long | sed 's/^[v]//;s/-/-r/' | tr - .)
}

build() {
  :
}

package() {
  cd "$srcdir/$_gitname"
  install -D -m755 inkscapeslide.py "${pkgdir}/usr/bin/inkscapeslide"
} 
