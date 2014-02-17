# Maintainer: TheWaffleGuy <gvxq@hotmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

_pkgbasename=pcsclite
pkgname=lib32-$_pkgbasename
pkgver=1.8.11
pkgrel=1
pkgdesc="PC/SC Architecture smartcard middleware library (32-bit)"
arch=('x86_64')
url="https://alioth.debian.org/projects/pcsclite/"
license=('BSD')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('pkg-config' 'gcc-multilib')
options=('!docs')
source=("https://alioth.debian.org/frs/download.php/latestfile/39/pcsc-lite-${pkgver}.tar.bz2")
md5sums=('73502ca4ba6526727f9f49c63d805408')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "${srcdir}/pcsc-lite-${pkgver}"

  sed -i -e "s:python:python2:g" src/spy/pcsc-spy

  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --enable-libudev \
              --sysconfdir=/etc \
              --enable-ipcdir=/run/pcscd \
              --enable-usbdropdir=/usr/lib/pcsc/drivers \
              --with-systemdsystemunitdir=/usr/lib/systemd/system \
              --libdir=/usr/lib32

  make
}

package() {
  cd "${srcdir}/pcsc-lite-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share,lib}
}
