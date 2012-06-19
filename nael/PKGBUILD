pkgname=nael
pkgver=20120619
pkgrel=1
pkgdesc="Stack-based language similar to Factor."
arch=(i686 x86_64)
url="https://github.com/dom96/nael"
license=("BSD")
makedepends=(nimrod)
_gitroot="https://github.com/dom96/nael.git"
_gitname="nael"

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
  cd "$srcdir/$_gitname-build/src"
  
  nimrod c -d:release main.nim
}

package() {
  cd "$srcdir/$_gitname-build/src"
  mkdir -p "$pkgdir/opt/nael/lib"
  mkdir -p "$pkgdir/usr/bin"
  cp "lib/"* "$pkgdir/opt/nael/lib"
  install -Dm755 "main" "$pkgdir/opt/nael/main"
  install -m644 "system.nael" "$pkgdir/opt/nael/system.nael"
  install -Dm644 "../license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  ln -s "/opt/nael/main" "$pkgdir/usr/bin/nael"
} 
