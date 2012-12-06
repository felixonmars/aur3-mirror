# Maintainer: roger <roger@rogerpc.com.ar>
# TODO: split the package
pkgname=qterminal-suite-git
pkgver=20121206
pkgrel=1
pkgdesc="Light QT-based  terminal emulator suit, with qtermwidget"
arch=('i686' 'x86_64')
url="https://github.com/qterminal/qterminal-suite"
license=('GPL2')
depends=('qt')
makedepends=('git' 'cmake')
conflicts=('qtermwidget-git' 'qterminal-git')
provides=(qterminal qtermwidget)
install=

_gitroot=https://github.com/qterminal/qterminal-suite.git
_gitname=qterminal-suite

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

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make

}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/lib64 $pkgdir/usr/lib
}

# vim:set ts=2 sw=2 et:
