# Maintainer: Eric Swanson <eswanson@alloscomp.com>

_pkgname=rdesktop
pkgname=rdesktop-xinerama
pkgver=1.7.1
pkgrel=3
pkgdesc="An open source client for Windows Remote Desktop Services with Xinerama support"
arch=('i686' 'x86_64')
url="http://www.rdesktop.org/"
license=('GPL3')
provides=('rdesktop=1.7.1')
conflicts=('rdesktop')
depends=('libx11' 'openssl' 'libao' 'libsamplerate' 'libxinerama')
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        'rdesktop-send_physical_buttons.diff' 'rdesktop-libao.patch' 'rdesktop-xinerama.patch')
md5sums=('c4b39115951c4a6d74f511c99b18fcf9'
         '880d3aeac67b901e6bf44d1323374768'
         'bd2c9bc68bddcc2652c668753d787df7'
         'f68f8db0fa47c0163aa30173a2d6adaf')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # FS#15113
  patch -i "${srcdir}/rdesktop-send_physical_buttons.diff"

  # Fix libao segfault, from Fedora
  patch -i "${srcdir}/rdesktop-libao.patch"

  # Enable Xinerama support (makes full-screen monitor specific)
  # Original patch from http://raller.wordpress.com/2008/06/26/xinerama-support-in-rdesktop/
  # Modified to apply to 1.7.1 / r1658
  patch -i "${srcdir}/rdesktop-xinerama.patch"

  # Removed exit key patch because of bug where release key event was swallowed
  # Use -K, then press Ctrl-Alt-Enter; WM keys can now be used (Ctrl-Super-Q for awesome)

  autoconf
  ./configure --prefix=/usr --enable-smartcard
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
