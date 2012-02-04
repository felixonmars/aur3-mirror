# Contributor: farid <farid at archlinux-br.org>
pkgname=fluxus
pkgver=0.17rc5
pkgrel=2
pkgdesc="A rapid prototyping, livecoding and playing/learning environment for 3D graphics and games."
arch=('i686' 'x86_64')
url="http://www.pawfal.org"
depends=('ode' 'drscheme360' 'fftw' 'jack' 'libsndfile' 'liblo' 'glew' 
'libtiff' 'libpng' 'libjpeg' 'openal' 'freeglut' 'alsa-lib' 'freetype2' 'libunicap' 'pth')
makedepends=('scons')
license=('GPL')
source=('http://git.savannah.gnu.org/cgit/fluxus.git/snapshot/fluxus-0.17rc5.tar.gz'
	'patches.diff')
md5sums=('8f2729a588fb5531fd191e6f0d1873b5' \
	 'ce01427298e27e4e41dae989553a52d0')

build(){
	cd ${srcdir}/${pkgname}-${pkgver}
	patch -b -p1 < ${startdir}/patches.diff || return 1
	scons PLTPrefix=/usr
	scons install Prefix=/usr PLTPrefix=/usr DESTDIR=${startdir}/pkg
}
