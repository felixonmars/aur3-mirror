# Maintainer: Calvin Morrison <mutantturkey@gmail.com>

pkgname=lget-git
pkgver=20101006
pkgrel=1
pkgdesc="a simple lyric retriever. gets lyrics, gets done."
arch=('i686' 'x86_64')
url="http://github.com/mutantturkey/lget/"
license=('GPL')
depends=('curl')
makedepends=('git')

_gitroot=git://github.com/mutantturkey/lget.git
_gitname=lget

build() {
  cd $srcdir

  msg "connecting to github's GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done"

  cd "$srcdir/$_gitname"
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

}
