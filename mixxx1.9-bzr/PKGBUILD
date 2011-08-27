# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=mixxx1.9-bzr
pkgver=2768
pkgrel=1
pkgdesc="Digital DJ mixing software. Branch 1.9 (stable) from bzr with cpu optimization enabled"
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
depends=('libid3tag' 'libmad' 'portaudio' 'qt>=4.7.0' 'libogg' 'libvorbis' 'libsndfile' 'taglib' 'portmidi')
makedepends=('bzr' 'scons>=0.98' 'pkgconfig>=0.15.0')
optdepends=('faad2: M4A support' 
			'mp4v2: M4A support' 
			'libshout: Shoutcast support')
provides=(mixxx)
conflicts=(mixxx-bzr mixxx1.8-bzr)

_bzrmod=mixxx
_bzrtrunk=lp:${_bzrmod}/1.9

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod}
  else
    bzr up ${_bzrmod}
    cd ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  cd "${srcdir}/${_bzrmod}/${_bzrmod}"

  scons qtdir=/usr/lib/qt prefix=/usr install_root=$pkgdir/usr tuned=1 || return 1
  scons qtdir=/usr/lib/qt prefix=/usr install_root=$pkgdir/usr install || return 1
}
