# Maintainer: Jeremiah Dodds <jeremiah.dodds@gmail.com>
pkgname='roundup-testtool-git'
pkgver=20120807
pkgrel=1
pkgdesc="A unit testing tool for POSIX shell scripts"
arch=('any')
url="http://bmizerany.github.com/roundup"
license=('BSD')
depends=('sh')
makedepends=('git')
optdepends=('ronn: for generating manpages' 'shocco: for generating manpages')
provides=('roundup-testtool')

_gitroot='https://github.com/bmizerany/roundup'
_gitname='roundup-testtool'

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

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make bindir="$pkgdir/usr/bin" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
