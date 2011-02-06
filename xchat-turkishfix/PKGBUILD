# Contributor: Samed Beyribey <ras0ir@eventualis.org>

pkgname=xchat-turkishfix
_origname=xchat
pkgver=2.8.8
pkgrel=1
pkgdesc="A GTK+ based IRC client"
arch=('i686' 'x86_64')
url="http://www.xchat.org/"
provides=('xchat')
conflicts=('xchat')
license=('GPL')
depends=('gtk2' 'openssl' 'dbus-glib')
makedepends=('tcl' 'perl' 'python')
optdepends=('enchant: for spell checking support' 'tcl: for tcl plugin' \
            'python: for python plugin')
options=('!libtool')
source=(http://www.xchat.org/files/source/${pkgver%.*}/${_origname}-${pkgver}.tar.xz
        ascii_str.patch)

build() {
  cd "${srcdir}/${_origname}-${pkgver}"
  patch -p1 -i $srcdir/ascii_str.patch
  ./configure --prefix=/usr --sysconfdir=/etc --enable-openssl --enable-dbus \
    --disable-textfe --enable-ipv6 --enable-shm --enable-spell=static || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${_origname}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
md5sums=('9a11f13121ff0af787bba3b014378e58'
         '097431921b959708916589797d6d37e8')
