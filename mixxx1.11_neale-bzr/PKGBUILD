# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=mixxx1.11_neale-bzr
pkgver=3298
pkgrel=2
pkgdesc="Digital DJ mixing software. Experimental branch 1.11 with built in support for the DJ Console MP3 e2 by Neale Pickett - no hdjmod needed"
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
depends=('libid3tag' 'libmad' 'portaudio' 'qt' 'qtwebkit' 'libogg' 'libvorbis' 'libsndfile' 'taglib' 'portmidi' 'protobuf')
makedepends=('bzr' 'scons>=0.98' 'pkgconfig>=0.15.0')
optdepends=('faad2: M4A support' 
			'mp4v2: M4A support' 
			'libshout: Shoutcast support'
			'vamp-plugin-sdk: Vamp support')
provides=(mixxx)
conflicts=(mixxx-bzr mixxx1.8-bzr mixxx1.9-bzr mixxx1.10-bzr mixxx1.11-bzr mixxx-beta hdjmod)

_bzrmod=neale
_bzrtrunk=lp:~${_bzrmod}/mixxx/neale

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

  cd "${srcdir}/${_bzrmod}/mixxx"

  scons qtdir=/usr/lib/qt prefix=/usr install_root=$pkgdir/usr tuned=1 || return 1
  scons qtdir=/usr/lib/qt prefix=/usr install_root=$pkgdir/usr install || return 1
}
