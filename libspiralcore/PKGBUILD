# Contributor: farid abdelnour < farid at atelier-labs.org>

pkgname=libspiralcore
pkgver=1.0.0rc1
pkgrel=1
pkgdesc="Base library for audio + osc"
arch=('i686')
url="http://www.pawfal.org/Software/libspiralcore/"
depends=('jack-audio-connection-kit' 'liblo' 'gcc-libs')
makedepends=('scons')
license=('GPL')
source=('http://www.pawfal.org/Software/libspiralcore/libspiralcore-1.0.0rc1.tar.gz' 
	'patches.diff')
md5sums=('dddee02b0d1ce970a7bcaf13ae34892f' 
	'ba5d9a08a37d6daaa56ea6a56c2b7ada')

build () {
  cd $startdir/src/${pkgname}-${pkgver}
  patch -b -p1 < ../patches.diff || return 1
  scons install prefix=$startdir/pkg/usr
}
