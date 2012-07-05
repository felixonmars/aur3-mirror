# Modified version of luminancehdr package for the latest release

pkgname=luminancehdr-latest
pkgver=2.3.0
pkgrel=1
pkgdesc='Open source graphical user interface application that aims to provide a workflow for HDR imaging'
arch=('i686' 'x86_64')
url='http://qtpfsgui.sourceforge.net/'
license=('GPL')
depends=('exiv2' 'fftw>=3.0' 'gsl' 'libraw' 'openexr' 'qt' 'qtwebkit')
optdepends=('hugin: align image stack functionality')
conflicts=('luminancehdr')
install=$pkgname.install
options=('!emptydirs')
source=(http://netcologne.dl.sourceforge.net/project/qtpfsgui/luminance/$pkgver/luminance-hdr-$pkgver.tar.bz2)

sha256sums=('dada0795b58843912bcb57ce61dcd615bcb9f9437b610a37ff813ad2c899c676')

build() {
  cd "${srcdir}"
  #mkdir "build"
  cd "luminance-hdr-$pkgver/build"
  cmake \
       	"${srcdir}/luminance-hdr-$pkgver"
  make
}

package() {
  cd "${srcdir}/luminance-hdr-$pkgver/build"

  make DESTDIR="${pkgdir}" install
}
