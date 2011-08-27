# Contributor: Denis Zawada <deno@rootnode.net>

pkgname=rhythmbox-gupnp-git
pkgver=20090208
pkgrel=1
pkgdesc="gUPnP framework plugin for rhythmbox"
_rhythmboxver=0.11.6
url="http://gupnp.org"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gupnp-av>=0.1.99' 'gnome-vfs' 'gtk2')
makedepends=('git')
conflicts=('rhythmbox-gupnp')
provides=('rhythmbox-gupnp')
replaces=()
backup=()
install=()
source=(http://ftp.gnome.org/pub/GNOME/sources/rhythmbox/0.11/rhythmbox-${_rhythmboxver}.tar.bz2)
md5sums=()

_gitroot="git://git.gupnp.org/rhythmbox-gupnp"
_gitname="rhythmbox-gupnp"

build() {
  cd ${srcdir}
  msg "Connecting to git.gupnp.org GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  msg "Starting make..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build

  ./autogen.sh --with-rhythmbox=${srcdir}/rhythmbox-${_rhythmboxver} \
               --libdir=/usr/lib || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
} 
