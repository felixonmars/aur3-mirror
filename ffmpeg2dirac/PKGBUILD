# Maintainer: Lukas Luther <lukasluther@googlemail.com>

pkgname=ffmpeg2dirac
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool to transcode any file that can be decoded by FFmpeg to Dirac muxed with Vorbis audio in Ogg."
arch=('i686' 'x86_64')
url="http://diracvideo.org/projects"
depends=('ffmpeg' 'dirac' 'libkate' 'schroedinger' 'libtheora')
makedepends=('scons')
license=('MPL')
source=('http://diracvideo.org/download/ffmpeg2dirac/ffmpeg2dirac-0.2.0.tar.gz')
md5sums=('5726829267ddbe3d1e20242d3a65a940')

build() {
	cd $srcdir/${pkgname}-${pkgver}
	scons || return 1
	scons install prefix=/usr destdir=$pkgdir
}
