pkgname=lte-tools-git
_pkgbase=lte-tools
pkgver=r57.5fa3df8
pkgrel=2
pkgdesc="A collection of open source tools to locate and track LTE eNodeBs (cells) with SDR, using very low performance RF front ends (such as the RTL2832)"
arch=('i686' 'x86_64')
url="http://www.evrytania.com/lte-tools"
license=('GPL3')
depends=('rtl-sdr'
         'itpp'
         'fftw'
         'boost-libs')
makedepends=('boost'
             'git')
source=("lte-tools::git://github.com/Evrytania/LTE-Cell-Scanner.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"

  rm -rf "${srcdir}/${_pkgbase}-build"
  git clone "${srcdir}/${_pkgbase}" "${srcdir}/${_pkgbase}-build"
  
  mkdir "${srcdir}/${_pkgbase}-build/build"
}

build() {
  cd "$srcdir/${_pkgbase}-build/build"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd "$srcdir/${_pkgbase}-build/build"
  make DESTDIR="${pkgdir}" install
}
