# Contributor: Niwi <niwi at niwi dot be>
pkgname=naviqator-hg
pkgver=52
pkgrel=1
pkgdesc="Qt webkit vi style browser. ¡Pero si es el archi enemigo de retumilo!"
arch=('i686' 'x86_64')
url="http://www.niwi.be/projects/naviqator/index.html"
license=('Public Domain')
depends=('qt')
makedepends=('mercurial' 'qt' 'cmake')
conflicts=("naviqator" "naviqator-git")
provides=("naviqator")

_hgroot="http://hg.niwi.be/"
_hgrepo="naviqator"

build() {
  cd "$srcdir"
  msg "Connecting to hg server...."

  if [ -d ${_hgrepo} ]; then
    cd ${_hgrepo}
    make clean
    hg pull -u
  else
    hg clone ${_hgroot}/${_hgrepo} ${_hgrepo}
    cd ${_hgrepo}
  fi

  msg "hg checkout done or server timeout"
  msg "Starting make..."

  rm -Rf "$srcdir/$_hgrepo-build"
  cp -R "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  cmake . || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
