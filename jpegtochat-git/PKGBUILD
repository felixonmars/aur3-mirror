# Maintainer: demonicmanic <namida1@gmx.net>

pkgname=jpegtochat-git
pkgver=20120504
pkgrel=1
pkgdesc="A JPEG to text graphics conversion tool supporting various types of terminals, irc clients and encodings."
arch=('x86_64' 'i686')
url="https://github.com/aempirei/JPEGTOCHAT.git"
license=('other')
depends=('libjpeg')
_gitroot="git://github.com/aempirei/JPEGTOCHAT.git"
_gitname="JPEGTOCHAT"

build() {
  cd "$srcdir"

  msg "Connecting to the git repository..."
  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  cd "$srcdir"
  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd "$_gitname-build"

  make
}

package() {
  cd "$_gitname-build"

  install -Dm755 jpegtochat "$pkgdir/usr/bin/jpegtochat"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
