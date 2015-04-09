# Maintainer: Sam Whited 4096R/54083AE104EA7AD3 <sam@samwhited.com>

pkgname=pidgin-extras
pkgver=2.10.11
pkgrel=4
pkgdesc="Pidgin IM library from source with support for Message Carbons."
arch=('i686' 'x86_64')
url="https://pidgin.im/"
license=('GPL')
options=('!libtool')
depends=('farstream-0.1' 'libxss' 'gtkspell' 'libsasl' 'libxml2' 'nss' 'gnutls' 'meanwhile' 'hicolor-icon-theme')
makedepends=('ca-certificates' 'intltool' 'git')
optdepends=('ca-certificates: SSL CA certificates')
conflicts=('pidgin' 'libpurple' 'finch')
provides=('libpurple' 'finch')
install=('pidgin-extras.install')
source=("git://git.assembla.com/pidgin-xmpp-receipts.git"
        "https://downloads.sourceforge.net/pidgin/pidgin-${pkgver}.tar.gz"
        "carbons.5.patch"
        "pidgin-extras.install")
sha256sums=('SKIP'
            '69dcfeead545d1ff2262c33285ad8d231429763d10aee50c38601999b762e828'
            '02bda3f5550b8c10645cb9d00040ec805c5751a3d64170eb3aee695a4dc38536'
            '0536e158e3e3f8a79a913136d44ba29e276aebd3933f361b27340834189f4adb')

build(){
  cd "${srcdir}/pidgin-${pkgver}"
  patch -p1 < ../carbons.5.patch
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-cyrus-sasl \
    --disable-perl \
    --disable-tcl \
    --disable-tk \
    --with-system-ssl-certs=/etc/ssl/certs
  make

  cd "${srcdir}/pidgin-xmpp-receipts/"
  GTK_PIDGIN_INCLUDES=$(pkg-config --cflags gtk+-2.0)
  INCLUDES="${GTK_PIDGIN_INCLUDES} \
    -I${srcdir}/pidgin-${pkgver}/pidgin \
    -I${srcdir}/pidgin-${pkgver}/libpurple"
  C_INCLUDE_PATHS="${srcdir}/pidgin-${pkgver}/pidgin:${srcdir}/pidgin-${pkgver}/libpurple:/usr/include/gtk-2.0" gcc xmpp-receipts.c -O2 -Wall -fpic -g ${INCLUDES} -shared -o xmpp-receipts.so

}

package() {
  cd "${srcdir}/pidgin-${pkgver}"
  make DESTDIR="${pkgdir}" install
  cp "${srcdir}/pidgin-xmpp-receipts/xmpp-receipts.so" \
     "${pkgdir}/usr/lib/pidgin/xmpp-receipts.so"
}
