# Contributor: Andrea Cimitan <andrea.cimitan@gmail.com>

pkgname=xchat-tango
pkgver=2.8.8
pkgrel=4
pkgdesc="A GTK+ based IRC client, Xchat, with Tango Icons"
arch=('i686' 'x86_64')
url="http://www.xchat.org/"
license=('GPL')
depends=('gtk2>=2.10.9' 'openssl>=0.9.8b' 'dbus-glib>=0.7.2')
makedepends=('tcl' 'perl' 'python')
optdepends=('enchant: for spell checking support')
options=('!libtool')
provides=('xchat')
replaces=('xchat')
conflicts=('xchat')
install=xchat.install
source=(http://www.xchat.org/files/source/${pkgver%.*}/xchat-${pkgver}.tar.bz2 xchat-tango-pack.tar.gz)
md5sums=('6775c44f38e84d06c06c336b32c4a452'
         'f23201103385f8607f1fefe378366b78')

build() {
  cd ${startdir}/src/xchat-${pkgver}

  # copy tango icons
  cp ${startdir}/src/xchat-tango-pack/pixmaps/*.png ${startdir}/src/xchat-${pkgver}/src/pixmaps/
  cp ${startdir}/src/xchat-tango-pack/xchat/* ${startdir}/src/xchat-${pkgver}/

  # compile as always
  ./configure --prefix=/usr --sysconfdir=/etc \
              --enable-openssl --enable-dbus \
              --disable-gnome --disable-textfe \
              --enable-ipv6 --enable-shm \
              --enable-spell=static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  # use tango icons in hicolor icon theme
  mkdir -p ${startdir}/pkg/usr/share/icons/
  cp -r ${startdir}/src/xchat-tango-pack/hicolor ${startdir}/pkg/usr/share/icons/
}
