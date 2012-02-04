# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=mork-git
pkgver=20110819
pkgrel=1
pkgdesc="mork is a funny (lua)alien(wrapper)"
arch=('i686' 'x86_64')
url="https://github.com/rrthomas/mork"
license=('unknown')
groups=()
depends=('lua' 'ctypesgen-json' 'alien' 'lua-stdlib' 'luajson')
makedepends=('git')
provides=('mork')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/rrthomas/mork.git
_gitname=mork

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
  cd "$srcdir/$_gitname-build"
  install -D mork.lua  ${pkgdir}/usr/share/lua/5.1/mork.lua
}

# vim:set ts=2 sw=2 et:
