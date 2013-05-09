# Maintainer: Gustavo Avarez <sl1pkn07@gmail.com>

pkgname=filezilla-gnutls-fix
_pkgname=gnutls
pkgver=1
pkgrel=1
pkgdesc="Filezilla fix for FTPES connections (over TLS explicit) by install GnuTLS 3.1.8 and override libs by wrapper"
arch=('i686' 'x86_64')
license=('GPL3' 'LGPL2.1')
url="https://bbs.archlinux.org/viewtopic.php?id=161496"
options=('!libtool')
depends=('gcc-libs>=4.7.1-5' 'libtasn1>=3.0' 'readline' 'zlib' 'nettle>=2.4' 'p11-kit>=0.12' 'filezilla')
makedepends=('valgrind' 'strace' 'datefudge')
install=filezilla-fix.install
source=('ftp://ftp.gnutls.org/gcrypt/gnutls/v3.1/gnutls-3.1.8.tar.xz'
        'filezilla-fix.desktop'
        'filezilla-fix.sh')
md5sums=('ffac9e22aba66057d5155ad0e3b62485'
         'f04b757a1876d078c5f69fbef2ea53fd'
         '9ae3fcb31128bcb9d21a0acb34b78af3')

prepare() {
  cd "${srcdir}"
  rm -fr "${_pkgname}"
  mv gnutls-3.1.8 "${_pkgname}"
}

build() {
  cd "${_pkgname}"
  ./configure --prefix="/opt/${pkgname}" \
              --with-zlib \
              --disable-static \
              --disable-guile \
              --disable-valgrind-tests
  make
}

check() {
  cd "${_pkgname}"
  make -k check
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/opt/${pkgname}/"{bin,include,lib/pkgconfig,share}
  install -Dm755 "${srcdir}/filezilla-fix.sh" "${pkgdir}/usr/bin/filezilla-fix"
  install -Dm644 "${srcdir}/filezilla-fix.desktop" "${pkgdir}/usr/share/applications/filezilla-fix.desktop"
}
