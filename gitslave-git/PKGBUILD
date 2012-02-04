# Maintainer: Alexandre Leray <alex @ stdin dot fr>
pkgname=gitslave-git
pkgver=20110224
pkgrel=1
pkgdesc="Gits - The git slave repository tool for super-project multi-repository management"
arch=('any')
url="http://gitslave.sourceforge.net"
license=('custom')
depends=('perl>=5', 'git')
makedepends=('git')
provides=('gitslave')

_gitroot="git://gitslave.git.sourceforge.net/gitroot/gitslave/gitslave"
_gitname="gitslave"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package(){
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
