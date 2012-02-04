#Maintainer: Gabriel Martinez <reitaka at gmail dot com>

pkgname=affinity-bzr
pkgver=185
pkgrel=1
pkgdesc="A stylish front-end to your desktop search"
arch=(i686 x86_64)
license=('GPL2')
depends=('python' 'gnome-desktop' 'libbeagle')
makedepends=('bzr' 'gnome-common' 'intltool' 'pkgconfig')
provides=('affinity')
#conflicts=(${_realname})
options=('!libtool')
#install=affinity.install
url="http://affinity.wikidot.com/"
source=()
md5sums=()

_bzrbranch=lp:affinity
_bzrname=affinity

build() {
  cd ${srcdir}
  msg "Connecting to BZR server..."

  if [ -d ${srcdir}/${_bzrname} ] ; then
    cd ${_bzrname} && bzr pull ${_bzrbranch}
    msg "Local repository updated."
  else
    bzr co ${_bzrbranch}
  fi
  #bzr branch ${_bzrbranch} -q -r ${pkgver}
  cd ${startdir}

  msg "BZR checkout done or server timeout"

  msg "Applying patches..."
  patch -p0 < ${startdir}/beagle_query.patch

  msg "Removing old build directory..."
  rm -Irf ${srcdir}/${_bzrname}-build

  msg "Creating new build directory..."
  cp -r ${srcdir}/${_bzrname} ${srcdir}/${_bzrname}-build

  cd ${srcdir}/${_bzrname}-build

  msg "Beginning build..."

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

}
# vim:set ts=2 sw=2 et:
