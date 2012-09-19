# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Road Tang <roadtang@gmail.com>
pkgname=pidgin-libqq
pkgver=20120919
pkgrel=1
pkgdesc="libqq for pidgin, protocol 2011"
arch=(i686 x86_64)
url="https://github.com/cnangel/pidgin-libqq"
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=(libqq-svn)
replaces=(libqq-svn)
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/cnangel/pidgin-libqq
_gitname=pidgin-libqq

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
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
#  make DESTDIR="$pkgdir/" install
  install -c -D .libs/libqq.so $pkgdir/usr/lib/purple-2/libqq.so
}

# vim:set ts=2 sw=2 et:
