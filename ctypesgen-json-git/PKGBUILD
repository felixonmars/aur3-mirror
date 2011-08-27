# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=ctypesgen-json-git
pkgver=20110819
pkgrel=1
pkgdesc="ctypesgen with json output"
arch=('i686' 'x86_64')
url="http://github.com/rrthomas/ctypesgen-json"
license=('unknown')
groups=()
depends=('python2')
makedepends=('git')
provides=('ctypesgen' 'ctypesgen-json')
conflicts=('ctypesgen')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/rrthomas/ctypesgen-json.git
_gitname=ctypesgen-json

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
  
  
  python2 setup.py install --root=$pkgdir
}




# vim:set ts=2 sw=2 et:
