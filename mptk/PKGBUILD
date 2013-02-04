# Maintainer: Kesmarag <kesmarag@gmail.com>
pkgname=mptk
pkgver=0.6.1
pkgrel=1
epoch=
pkgdesc="A fast implementation of the Matching Pursuit algorithm by IRISA"
arch=('any')
url="http://mptk.irisa.fr"
license=('GPL')
groups=()
depends=('cmake' 'qt' 'fftw' 'libsndfile')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gforge.inria.fr/frs/download.php/30005/MPTK-Source-$pkgver.tar.gz")
noextract=()
md5sums=('f7e0cdd45178d183f605df2e60f98723') #generate with 'makepkg -g'

build() {
  cd "$srcdir/"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd "$srcdir/"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
