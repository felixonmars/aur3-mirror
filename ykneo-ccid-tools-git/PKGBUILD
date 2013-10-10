# Maintainer: Andres <andres@krutt.org>
pkgname=ykneo-ccid-tools-git
pkgver=0.0.1
pkgrel=1
pkgdesc="YubiKey NEO CCID Tools"
arch=('x86' 'x86_64')
url="http://opensource.yubico.com/ykneo-ccid-tools/"
license=('BSD')
groups=()
depends=('pcsclite')
makedepends=('git' 'gengetopt' 'help2man')

_gitroot="https://github.com/Yubico/ykneo-ccid-tools.git"
_gitname="ykneo-ccid-tools"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  autoreconf -fvi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
