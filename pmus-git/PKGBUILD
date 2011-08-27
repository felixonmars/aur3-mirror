# Contributor: totoloco <totoloco at gmail dot com>

pkgname=pmus-git
pkgver=20091113
pkgrel=1
pkgdesc="Practical Music Search is a highly configurable ncurses-based MPD client written in C++."
url="http://pms.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses' 'glib2')
provides=('pmus')
conflicts=('pmus')
md5sums=()

_gitname="pms"
_gitroot="git://$_gitname.git.sourceforge.net/gitroot/$_gitname/$_gitname"

build() {
  cd $srcdir
  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -Rf $_gitname-build
  cp -R $_gitname $_gitname-build
  cd $_gitname-build

  ./autogen.sh
	./configure --prefix=/usr || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
