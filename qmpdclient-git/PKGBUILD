# created 19:32:43 - 02/08/09
# Mainteiner: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=qmpdclient-git
pkgver=20111216
pkgrel=1
pkgdesc="A Qt4 client for MPD"
url="http://bitcheese.net/wiki/QMPDClient"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt')
makedepends=('git' 'cmake')
conflicts=('qmpdclient')
provides=('qmpdclient')

_gitroot='https://github.com/Voker57/qmpdclient.git'
_gitname='qmpdclient'

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
}

# vim:set ts=2 sw=2 et:

