# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Peter Feigl <craven@gmx.net>
pkgname=glxw-git
pkgver=20140701
pkgrel=1
pkgdesc="OpenGL loader and dynamic linker"
arch=(i686 x86_64)
url="https://github.com/rikusalminen/glxw"
license=('custom')
groups=()
depends=('libgl')
makedepends=('git' 'python' 'cmake')
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

_gitroot=https://github.com/rikusalminen/glxw.git
_gitname=glxw

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
  mkdir build && cd build && cmake .. && make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p ${pkgdir}/usr
  cp -R build/include ${pkgdir}/usr
  mkdir -p ${pkgdir}/usr/share/
  cp -R build/src ${pkgdir}/usr/share/glxw
  #  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
