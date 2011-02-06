# Maintainer: Jeremie Lasalle Ratelle <lasallej at iro dot umontreal dot ca>
# Contributor:  <farid at archlinux-br dot org>

pkgname=scsynth
pkgver=3.3.1
pkgrel=1
pkgdesc="The SuperCollider server for real time audio synthesis"
arch=('i686' 'x86_64')  
url="http://supercollider.sourceforge.net/"
license=('GPL')
depends=('jack-audio-connection-kit' 'avahi' 'fftw' 'alsa-lib' 'libsndfile>=1.0' 'curl>=7.0')
makedepends=('subversion' 'gcc>=3.0' 'pkgconfig>=0.14.0' 'scons>=0.96')
source=(https://sourceforge.net/projects/supercollider/files/Source/SuperCollider-3.3.1-Source-linux.tar.gz)
md5sums=('bde5a25727ab854cc6a4f12a2691ac7b')

build() {
  cd $startdir/src/SuperCollider-Source
  scons PREFIX=/usr LANG=no SCEL=no SCVIM=no SCED=no CURL=yes || return 1
  scons DESTDIR=$startdir/pkg/ install
}

