# Maintainer: Eric Swanson <eswanson@alloscomp.com>

_pkgname=rdesktop
pkgname=rdesktop-urgent
pkgver=1.7.1
pkgrel=1
pkgdesc="An open source client for Windows Remote Desktop Services that sets the XUrgencyHint hint when a sound is played in windows"
arch=('i686' 'x86_64')
url="http://www.rdesktop.org/"
license=('GPL3')
provides=('rdesktop=1.7.1')
conflicts=('rdesktop')
depends=('libx11' 'openssl' 'libao' 'libsamplerate' 'libxinerama')
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        'rdesktop-send_physical_buttons.diff'
        'rdesktop-libao.patch'
        'rdesktop-urgent.patch')
md5sums=('c4b39115951c4a6d74f511c99b18fcf9'
         '880d3aeac67b901e6bf44d1323374768'
         'bd2c9bc68bddcc2652c668753d787df7'
         '21af5f05332a1d37ee6ef9b3e67f4419')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # FS#15113
    patch -i "${srcdir}/rdesktop-send_physical_buttons.diff"

  # Fix libao segfault, from Fedora
    patch -i "${srcdir}/rdesktop-libao.patch"

  # Make it so the XUrgencyHint will be set when rdesktop plays a sound
  # very hacky
  patch -i "${srcdir}/rdesktop-urgent.patch"

#  autoconf
  ./configure --prefix=/usr --enable-smartcard
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
