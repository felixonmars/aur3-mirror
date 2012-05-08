# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Sebastien Binet (binet@cern.ch)

pkgname=hippodraw
pkgver=1.21.3
pkgrel=3
pkgdesc="A highly interactive data analysis environment written in C++/Qt"
arch=('i686' 'x86_64')
url="http://www.slac.stanford.edu/grp/ek/hippodraw/"
license=('GPL')
depends=('boost' 'cfitsio' 'minuit2' 'python-numarray'
         'python2-pyfits' 'qt' 'qt-assistant-compat')
options=('!libtool')
source=("http://pkgs.fedoraproject.org/repo/pkgs/HippoDraw/HippoDraw-${pkgver}.tar.gz/d4b427b7469af5728951eab8c502074d/HippoDraw-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "00-gcc43.patch"
        "01-gcc45.patch"
        "02-qt-assistant.patch")
md5sums=('d4b427b7469af5728951eab8c502074d'
         '1a0cbbeacc51a34de6cd358d23c0b12f'
         '8d9f8bbee5e8a790f85fcf3b2cb9891d'
         'a07f086d7e630345205e5a5290b2f4a8'
         '4b42b7d5c9a95f1ffab39d3b3514e064')

build() {
  cd "${srcdir}/HippoDraw-${pkgver}"

  # Fix the configure file
  sed -i "s_Minuit2Base_Minuit2_" configure
  sed -i "s_/usr/include/cfitsio_/usr/include_" configure

  # Apply Fedora patches
  patch -Np1 -i ../00-gcc43.patch
  patch -Np1 -i ../01-gcc45.patch

  # Apply a patch to fix Qt Assistant issue
  patch -Np1 -i ../02-qt-assistant.patch

  ./configure \
    --prefix=/usr \
    --disable-help \
    --with-qt4-dir=/usr \
    --with-qt4-include=/usr/include \
    --with-qt4-lib=/usr/lib \
    LDFLAGS=-fopenmp \
    PYTHON=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/HippoDraw-${pkgver}"

  make prefix="${pkgdir}/usr" install
  rm -r "${pkgdir}/usr/share/icons"

  # Install a desktop entry
  install -Dm644 images/hippoApp.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
