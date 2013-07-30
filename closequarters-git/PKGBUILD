# Maintainer: Niklas Hedlund <nojan1989@gmail.com>
pkgname=closequarters-git
pkgver=43.7e71768
pkgrel=1
pkgdesc="2D top view zombie shooter game in cramped coridors"
url="http://github.com/nojan1/closeQuarters"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=(python2 python2-pygame)
optdepends=()
makedepends=()
provides=(closequarters)
source=('git://github.com/nojan1/closeQuarters.git')
md5sums=('SKIP')

_gitname='closeQuarters'

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"
    
  #Do some sed magic here to change paths around
  sed -i 's|./|/usr/share/closequarters/|g' config.py

  mv main.py closeQuarters
  sed -i 's/from core/from closequarters.core/' closeQuarters
  sed -i 's/from menu/from closequarters.menu/' closeQuarters

  echo "pass" > __init__.py
}

package() {
  cd "$srcdir/$_gitname"
 
  #Copy media stuff to correct place
  mkdir -p $pkgdir/usr/share/closequarters
  cp -r {images,levels,sounds,music} $pkgdir/usr/share/closequarters/

  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
