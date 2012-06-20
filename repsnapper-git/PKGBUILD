# Contributor:	Thomas Mudrunka <harvie@@email..cz>
# Contributor:	Nick Østergaard <oe.nick at gmail dot com>
# Maintainer: 	Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=repsnapper-git
pkgver=20120620
pkgrel=1
pkgdesc="RepSnapper RepRap control software"
arch=('x86_64' 'i686')
url="https://github.com/timschmidt/repsnapper"
license=('GPL')
depends=('libreprap-git' 'gtkglext' 'libxml++')
makedepends=(git)
source=()
md5sums=()

_gitroot='git://github.com/timschmidt/repsnapper.git'
_gitname="$pkgname"

build() {
  cd ${srcdir}/

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
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
  make DESTDIR="$pkgdir/" install
}
