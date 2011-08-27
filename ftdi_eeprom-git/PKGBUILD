# Maintainer: Rick W. Chen <stuffcorpse@archlinux.us>
pkgname=ftdi_eeprom-git
pkgver=20110706
pkgrel=1
pkgdesc="A tool for creating, uploading, and erasing the configuration EEPROM for a FT232BM/FT245BM FTDI chip"
arch=(i686 x86_64)
url="http://www.intra2net.com/en/developer/libftdi"
license=('GPL2')
depends=('confuse' 'libftdi')
makedepends=('git')
provides=('ftdi_eeprom')
conflicts=('ftdi_eeprom')

_gitroot="git://developer.intra2net.com/ftdi_eeprom"
_gitname="ftdi_eeprom"
_builddir="${srcdir}/build"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_builddir}
  mkdir ${_builddir} && cd ${_builddir}

  cmake ${srcdir}/${_gitname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${_builddir}
  make DESTDIR="${pkgdir}" install
} 
