# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=ta3d
pkgver=0.5.4
pkgrel=2
pkgdesc='A recreation of the "Total Annihilation" engine in real 3D'
arch=('i686' 'x86_64')
url="http://ta3d.org/home-en.php"
license=('GPL')
depends=('libgl' 'fmodex' 'allegro4' 'glu')
makedepends=('cmake' 'mesa')
source=("http://downloads.ta3d.org/sources/ta3d-v-0-5-4-src.tar.gz"
        "ta3d-build-fixes.diff"
        "ta3d-arch-folders.diff")
sha256sums=('98830a0e723d4385f89e73b66395819bf274f4afd0874fcfab1f9c2b2905a6da'
            '9b256c419c02d050671db6032762d0384f3fe767e33350ce875b57a5330ecfbd'
            '94bb5ed2a75dc7a1004db012a574a0fdabe70e06e33d8b1667325e8170754b9d')

prepare() {
  # this fixes various errors
  patch -Np0 < ta3d-build-fixes.diff
  # moves files to better locations
  patch -Np0 < ta3d-arch-folders.diff
}

build() {
  cd ta3d

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ta3d

  make DESTDIR="$pkgdir/" install
}
