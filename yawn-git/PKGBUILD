# Maintainer: neos300 <neos300@neos300.com>
pkgname=yawn-git
pkgver=0.1
pkgrel=2
pkgdesc="A simple window manager"
arch=('i686' 'x86_64')
url="http://neos300.com"
license=('MIT')
groups=()
depends=('dmenu' 'xorg-server' 'xorg-server-common' 'xorg-xinit')
makedepends=(make)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
#source=(http://neos300.com/$pkgname-$pkgver.tar.gz)
noextract=()
#md5sums=('4da21ec2ae95a8a29026950dfeef7055')
_gitroot="git://github.com/neos300/yawn.git"
_gitname="yawn"
build() {
  cd "$srcdir"
  msg "Pulling source from git"
  if [ -d $_gitname ] ; then
	  cd $_gitname && git pull origin
	  msg "Local repo updated"
  else
	  git clone $_gitroot --depth=1
  fi
  msg "Code checked out, or the server timed out."
  cd "$_gitname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="$pkgdir/" install
}
