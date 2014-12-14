# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=vooya
pkgver=1.3.2
pkgrel=1
pkgdesc="Raw YUV/RGB Video Player."
arch=('i686' 'x86_64')
url="http://www.offminor.de/"
license=('GPL')
depends=('ilmbase102-libs' 'libtiff' 'openexr170-libs' 'qt4')
options=('!emptydirs')
install=vooya.install

# Download the package(Ubuntu version with your architecture) manually from 'http://www.offminor.de/downloads.html'
# and place .deb package in this directory.
# Build package manually with 'makepkg -s' and install it with 'pacman -U vooya-1.3.2-1-' and your achitecture.

if [ "${CARCH}" = 'x86_64' ]; then
  source=("hib://$pkgname-1.3-amd64.deb")
  md5sums=('cd5d8581aec4cc50688e0a13ed84caf4')
elif [ "${CARCH}" = 'i686' ]; then 
  source=("hib://$pkgname-1.3-i386.deb")
  md5sums=('ea92da788bbec8f8d23dc2a606724874')
fi

package() {
  # Extract .deb
  bsdtar xf $pkgname*
  bsdtar xf data.tar.gz -C $pkgdir
  
  # (Dirty) hack to make this work.
  # This package has hardcoded link to libtiff.so.4(Ubuntu) and Arch uses libtiff.so.5.
  # I have to create a symlink from libtiff.so.4 to libtiff.so.5 in install.file.
  # This symlink will be deleted if 'vooya' is removed!
}