# Maintainer: Clément Guérin <geecko.dev@free.fr>
pkgname=icat-git
pkgver=20120505
pkgrel=1
pkgdesc="icat (Image cat) outputs images in 256-color capable terminals."
arch=('i686' 'x86_64')
url="https://github.com/atextor/icat"
license=('BSD')
depends=('imlib2')
makedepends=('git')
provides=('icat')

_gitroot="git://github.com/atextor/icat.git"
_gitname="icat"

build() {
  cd "$srcdir"
  msg "Connecting to Git server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot $_gitname
  fi

  msg "Compiling..."

  cd "$srcdir/$_gitname"
  make clean
  make
}

package() {
  cd "$srcdir"

  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  cp "$srcdir/$_gitname/icat" "$pkgdir/usr/bin"
}
