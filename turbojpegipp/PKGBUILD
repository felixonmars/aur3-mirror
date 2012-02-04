# Contributor: Kaspar Bumke <kaspar.bumke@gmail.com>
pkgname=turbojpegipp
_srcname=turbojpeg
pkgver=1.11
pkgrel=1
pkgdesc="A JPEG codec that is tuned to provide high frame rates at the expense of using a bit more network bandwidth."
arch=('i686')
url="http://virtualgl.org"
license=('GPL')
depends=()
makedepends=(rpmextract)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
md5sums=('1c4cbe40d994abc05b2157673a32f769')
install=
source=("http://downloads.sourceforge.net/project/virtualgl/TurboJPEG-IPP%20%28OBSOLETE%20--%20use%20libjpeg-turbo%29/1.11/turbojpeg-1.11.i386.rpm")
noextract=($_srcname-$pkgver.i386.rpm)
build() {
  cd "$srcdir"
  rpmextract.sh $_srcname-$pkgver.i386.rpm
  mv usr $pkgdir
}
