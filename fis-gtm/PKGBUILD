pkgname=fis-gtm
pkgver=6.1_000
pkgrel=1
pkgdesc='Industrial Strength NoSQL Application Development Platform '
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/fis-gtm'
license=('GPL2')
depends=('tcsh' 'elfutils' 'zlib' 'icu' 'gpgme' 'libgpg-error' 'libgcrypt')
makedepends=('cmake')
source=('http://downloads.sourceforge.net/project/fis-gtm/GT.M-x86-Linux-src/V6.1-000/fis-gtm-V6.1-000.tar.gz')
sha1sums=('db27128b208440294fc04b1d98d899e677b2cdb4')

build() {
  mkdir build
  cd build
  cmake ../${pkgname}-V${pkgver/_/-} -DCMAKE_INSTALL_PREFIX=${PWD}
  make -j4 install
}

package() {
  mkdir -p ${pkgdir}/opt/fis-gtm/V${pkgver/_/-}_$CARCH
  cd build/lib/fis-gtm/V${pkgver/_/-}_$CARCH/
  echo -e "bin\nbin\ny\n${pkgdir}/opt/fis-gtm/V${pkgver/_/-}_$CARCH\ny\ny\nn\nn\nn\ny\n" | ./configure
}
