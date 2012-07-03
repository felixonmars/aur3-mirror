# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: xavi <xavi@netsons.org>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=xchat-lite-noplugin
pkgver=2.8.8
pkgrel=1
pkgdesc="xchat irc client with no plugin support at all, no dbus, no spellcheck and only the text interface"
arch=('i686' 'x86_64')
url="http://www.xchat.org/"
license=('GPL')
depends=('openssl') #'gtk2'
conflicts=('xchat')
provides=('xchat')
options=('!libtool')
source=(http://xchat.org/files/source/2.8/xchat-$pkgver.tar.xz
        xchat-2.8.8-glib-2.31.patch)
md5sums=('9a11f13121ff0af787bba3b014378e58'
         '98f5c7b49a3e0bad4ef0b7871fdcd8b5')

build() {
  cd ${srcdir}/xchat-${pkgver}
  patch -p1 -i "${srcdir}/xchat-2.8.8-glib-2.31.patch"
  
  ./configure --prefix=/usr --sysconfdir=/etc \
              --enable-openssl --disable-dbus \
              --disable-gtkfe --enable-shm \
              --enable-spell=none --disable-plugin \
              --disable-perl --disable-python \
              --disable-perl_old --enable-tcl=no --enable-textfe

  make
}

package() {
  cd ${srcdir}/xchat-${pkgver}
  make DESTDIR=${pkgdir} install
}
