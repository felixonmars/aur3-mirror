# Maintainer: Dominik Heidler <dheidler@gmail.com>

pkgname=libosmocore-git
pkgver=20120307
pkgrel=1
pkgdesc="core libs for osmocom"
arch=('x86_64' 'i686')
url="http://bb.osmocom.org/trac/wiki/libosmocore"
license=('GPL')
groups=()
provides=('libosmocore')
depends=()
makedepends=('git' 'autoconf' 'automake' 'make' 'gcc' 'libtool')
install='libosmocore.install'
source=()
md5sums=()

_gitroot="git://git.osmocom.org/libosmocore.git"
_gitname="libosmocore"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_gitname"

  autoreconf -i || return 1
  ./configure --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --datadir=/usr/share \
              --libexecdir=/usr/lib --localstatedir=/var --docdir=/usr/share/doc/libosmocore --libdir=/usr/lib/ || return 1
  make
}
package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=$pkgdir install
} 
