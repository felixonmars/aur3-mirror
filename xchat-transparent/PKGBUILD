# Contributor: Erik Xian <erikxian@gmail.com>

pkgname=xchat-transparent
_pkgname=xchat
pkgver=2.8.8
pkgrel=1
pkgdesc="A GTK+ based IRC client with true transparency patches"
arch=('i686' 'x86_64')
url="http://www.xchat.org/"
license=('GPL')
depends=('gtk2' 'openssl' 'dbus-glib')
makedepends=('tcl' 'perl' 'python')
optdepends=('enchant: for spell checking support' 'tcl: for tcl plugin' \
            'python: for python plugin')
options=('!libtool')
provides=('xchat')
conflicts=('xchat')
source=(http://www.xchat.org/files/source/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz xchat-alpha.patch)
md5sums=('9a11f13121ff0af787bba3b014378e58'
         'dca92d94695c0c3145cccf49a6859c84')

build() {
  patch -d ${srcdir}/${_pkgname}-${pkgver}/src/fe-gtk/ <xchat-alpha.patch || return 1
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --enable-openssl --enable-dbus \
    --disable-textfe --enable-ipv6 --enable-shm --enable-spell=static || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
