# Maintainer: Constantin Schomburg <me@xconstruct.net>
# Contributor: Kaspar Bumke <kaspar.bumke@gmail.com>
pkgname=virtualgl-bin
_srcname=VirtualGL
pkgver=2.3.1
_srcbranch='2.3.1'
pkgrel=1
pkgdesc="Redirects 3D commands from an OpenGL application onto a server-side 3D graphics card."
arch=('i686' 'x86_64')
url="http://virtualgl.org"
license=('GPL')
makedepends=(rpmextract)
provides=("virtualgl=${pkgver}")
conflicts=('virtualgl')

case "$CARCH" in
	i686)
		_bldarch="i386"
		md5sums=('24cb41e3b9fbfb0514a75f1ed35ac8e0');;
	x86_64)
		optdepends=('virtualgl32-bin: serverside components to run 32-bit applications')
		_bldarch="x86_64"
		md5sums=('9c3634009d364fab8e0fc74d14b89925');;
esac

source=("http://downloads.sourceforge.net/project/virtualgl/VirtualGL/$_srcbranch/$_srcname-$pkgver.$_bldarch.rpm")
noextract=($_srcname-$pkgver.$_bldarch.rpm)

build() {
  cd "$srcdir"
  rpmextract.sh $_srcname-$pkgver.$_bldarch.rpm
  mv usr opt $pkgdir
}

