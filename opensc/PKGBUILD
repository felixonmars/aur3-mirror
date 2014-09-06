pkgname=opensc
pkgver=0.14.0
pkgrel=2
pkgdesc="Tools and libraries for smart cards"
arch=("i686"
      "x86_64")
url="https://github.com/OpenSC/OpenSC/wiki"
license=("LGPL")
backup=("etc/opensc.conf")
makedepends=("docbook-xsl")
options=("strip"
         "!emptydirs")
depends=("ccid"
         "openssl"
         "libltdl"
         "pcsclite")
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=("8e99885dbe28a9c71d5140f0105c56ff")

build() {
  cd "${pkgname}-${pkgver}"
  export LIBS=-lltdl
  sheetdir=(/usr/share/xml/docbook/xsl-stylesheets-*)
  ./configure         \
    --prefix=/usr     \
    --sysconfdir=/etc \
    --enable-sm       \
    --enable-man      \
    --enable-doc      \
    --enable-pcsc     \
    --enable-zlib     \
    --enable-openssl  \
    --enable-readline \
    --with-xsl-stylesheetsdir="${sheetdir}"
  make || return 1
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
  install -Dm 644 etc/opensc.conf "${pkgdir}/etc/opensc.conf"
}
