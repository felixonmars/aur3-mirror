# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=acm
pkgver=5.0
pkgrel=1
pkgdesc="A classic multiplayer flight simulator for Unix/X11"
arch=('i686' 'x86_64')
url="http://www.websimulations.com/"
license=('GPL')
depends=('gdbm' 'libxext')
source=("http://www.websimulations.com/download/${pkgname}-${pkgver}.tar.gz"
        "http://ftp.debian.org/debian/pool/main/a/acm/acm_5.0-28.diff.gz"
        "${pkgname}-arch.patch"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('8d27051a3aa0d85b90f66a86f746e827'
         'ea39031a834642928240999933d7f086'
         'ab4bf625b8513e5371a4eccb0990dd5b'
         'cb347ae46c6ef8490486183997d19a14'
         '714faae126b92b371967f347d12a15a8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Apply Debian patches
  patch -Np1 -i ../${pkgname}_5.0-28.diff

  # Apply Arch patches
  patch -Np1 -i ../${pkgname}-arch.patch

  ./configure --prefix=/usr
  make LDFLAGS=-lgdbm_compat
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make bindir="${pkgdir}/usr/bin" \
       prefix="${pkgdir}/usr/share" \
       OBVDIR="${pkgdir}/usr/share/${pkgname}/" \
       INSTALL="/usr/bin/install -c -D" \
       install

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 ACM* COPYING README acmdoc.rtf "${pkgdir}/usr/share/doc/${pkgname}"
}
