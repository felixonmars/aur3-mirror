# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.com>

_pkg=lua-kiss
pkgname=$_pkg-git
pkgver=20130902
pkgrel=1
pkgdesc="Thin wrapper for KissFFT, allowing one to use LuaJIT FFI to use KissFFT inside Lua."
arch=('i686' 'x86_64')
url="http://oproj.tuxfamily.org" 
depends=('luajit>=2.0.2')
license=('BSD')
provides=("$_pkg")
conflicts=("$_pkg")

_gitroot=https://lucashnegri@bitbucket.org/lucashnegri/lua-kiss.git
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
  cd "$srcdir/$_gitname-build"
  make  
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "$pkgdir/usr/share/lua/5.1/"
  mkdir -p "$pkgdir/usr/lib/"
  cp kiss.lua "$pkgdir/usr/share/lua/5.1/"
  cp libluakiss.so "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir/usr/share/licenses/$_pkg/"
  cp COPYRIGHT "$pkgdir/usr/share/licenses/$_pkg/"
}
