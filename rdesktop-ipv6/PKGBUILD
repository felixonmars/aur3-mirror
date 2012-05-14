# Contributor: sh0 <mee@sh0.org>

_pkgname=rdesktop
pkgname=rdesktop-ipv6
pkgver=1.7.1
pkgrel=2
pkgdesc="An open source client for Windows Remote Desktop Services (with IPv6 support)"
arch=('i686' 'x86_64')
url="http://www.rdesktop.org/"
license=('GPL3')
depends=('libx11' 'openssl' 'libao' 'libsamplerate')
conflicts=('rdesktop')
replaces=('rdesktop')
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        'rdesktop-send_physical_buttons.diff' 'rdesktop-libao.patch')
md5sums=('c4b39115951c4a6d74f511c99b18fcf9'
         '880d3aeac67b901e6bf44d1323374768'
         'bd2c9bc68bddcc2652c668753d787df7')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # FS#15113
  patch -i "${srcdir}/rdesktop-send_physical_buttons.diff"

  # Fix libao segfault, from Fedora
  patch -i "${srcdir}/rdesktop-libao.patch"

  ./configure --prefix=/usr --enable-smartcard --with-ipv6
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
