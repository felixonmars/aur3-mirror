pkgname=claro
pkgver=20120718
pkgrel=1
pkgdesc="Cross platform GUI library with backends for Gtk+, Cocoa, and Win32"
arch=(i686 x86_64)
url="https://github.com/Araq/Claro"
license=("MPL")
depends=(gtk2)
makedepends=(git python2)
_gitroot="https://github.com/Araq/Claro.git"
_gitname="Claro"

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

  sed -i -e 's/" -Werror"/""/' "koch.py"
  python2 koch.py claro
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 "build/libclaro.so" "$pkgdir/usr/lib/libclaro.so"
  mkdir -p "$pkgdir/usr/include/claro"
  cp -rf include/* "$pkgdir/usr/include/claro"
} 
