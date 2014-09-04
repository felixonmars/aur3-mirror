# Maintainer: Peter Feigl <craven@gmx.net>
pkgname=scrypt-genpass-git
pkgver=20140903
pkgrel=1
pkgdesc="Generates site-specific passwords from a master password using Colin Percival's scrypt"
arch=(x86_64 i686)
url="https://github.com/chrisoei/scrypt-genpass"
license=('unknown')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
md5sums=()
noextract=()
#generate with 'makepkg -g'

_gitroot=https://github.com/chrisoei/scrypt-genpass.git
_gitname=scrypt-genpass

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
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  # remove scrypt man page, shouldn't even be in this package
  rm -fR $pkgdir/usr/share
}

# vim:set ts=2 sw=2 et:
