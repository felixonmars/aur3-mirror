# Maintainer: guillaume bouchard <guillaum.bouchard@gmail.com>
pkgname=jedi-git
pkgver=20121016
pkgrel=1
pkgdesc="Python auto completion library"
arch=(any)
url="https://github.com/davidhalter/jedi"
license=('GPL3')
depends=('python2')
makedepends=('git')

_gitroot="https://github.com/davidhalter/jedi.git"
_gitname="jedi"

build() {
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot $_gitname
  fi
  
  cd "$srcdir/jedi"

  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1

}
