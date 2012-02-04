# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=lua-stdlib-git
pkgver=20110819
pkgrel=1
pkgdesc="lua stdlib (i have no clue but mork needs it)"
arch=('i686' 'x86_65')
url="https://github.com/rrthomas/lua-stdlib"
license=('unknown')
groups=()
depends=('lua')
makedepends=('git')
provides=('lua-stdlib')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/rrthomas/lua-stdlib.git
_gitname=lua-stdlib

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
}

package() {
  cd "$srcdir/$_gitname-build/modules"
  for i in *; do install -D $i $pkgdir/usr/share/lua/5.1/$i; done

}

# vim:set ts=2 sw=2 et:
