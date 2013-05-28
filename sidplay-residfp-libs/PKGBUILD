# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplay-residfp-libs
pkgver=1.0.2
pkgrel=1
pkgdesc="Sidplay2 fork with improved filter emulation."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sidplay-residfp/"
license=('GPL')
depends=('gcc-libs')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/sidplay-residfp/libsidplayfp/1.0/libsidplayfp-${pkgver}.tar.gz")
sha256sums=('e89312768b4e05dcc4bc1949189d7aa1eade8390ae5b86c6dd72d3b5ad8e48a9')

build() {
  cd libsidplayfp-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd libsidplayfp-${pkgver}
  make DESTDIR="${pkgdir}" install
}

