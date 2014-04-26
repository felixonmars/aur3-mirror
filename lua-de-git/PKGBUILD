# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.com>

_pkg=lua-de
pkgname=$_pkg-git
pkgver=20140425
pkgrel=1
pkgdesc="An implementation of the differential evolution algorithm for Lua."
arch=(any)
url="http://oproj.tuxfamily.org" 
depends=('lua>=5.1')
license=('MIT')
provides=("$_pkg")
conflicts=("$_pkg")

_gitroot=https://lucashnegri@bitbucket.org/lucashnegri/lua-de.git
_gitname=$_pkg

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
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "$pkgdir/usr/share/lua/5.1/"
  mkdir -p "$pkgdir/usr/share/lua/5.2/"
  mkdir -p "$pkgdir/usr/share/licenses/$_pkg/"
  cp de.lua "$pkgdir/usr/share/lua/5.1/"
  cp de.lua "$pkgdir/usr/share/lua/5.2/"
  cp COPYRIGHT "$pkgdir/usr/share/licenses/$_pkg/"
}
