# Maintainer: Nick Østergaard <oe.nick at gmail.com>
# Contribuator: Paul Kremser <to.kremser at gmail.com>
pkgname=heekscad-git
pkgver=20130318
pkgrel=1
pkgdesc="A free CAD program based on Open CASCADE"
arch=('i686' 'x86_64')
url="https://github.com/Heeks/heekscad"
license=('custom:BSD3')
depends=('python2' 'wxgtk' 'gtkglext' 'opencascade' 'hicolor-icon-theme' 'xdg-utils' 'tinyxml')
makedepends=('git' 'cmake' 'python2' 'wxgtk' 'gtkglext' 'opencascade')
provides=('heekscad')
conflicts=('heekscad' 'heekscad-svn')
install=heekscad.install
source=( heekscad_PI.patch )
noextract=()
md5sums=('4d512b3d783489fd593c075662d0ca9e')

_gitroot=git://github.com/Heeks/heekscad.git
_gitname=heekscad

_gitroot_area=git://github.com/Heeks/libarea.git
_gitname_area=libarea

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    cd "$_gitname_area" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname" && git clone "$_gitroot_area" "$_gitname_area"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  export CASROOT=/opt/opencascade
  cmake CMAKE_INSTALL_PREFIX=/usr .

  # Copy license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package() {
  cd "$srcdir/$_gitname-build"
  make install DESTDIR=$pkgdir

  # Remove symlink to be compatible with the community/tinyxml package
  rm $pkgdir/usr/lib/libtinyxml.so 
}

# vim:set ts=2 sw=2 et:
