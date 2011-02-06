# Contributor: Ramiro Blanco <ramiro.blanco@globant.com>

pkgname=xchat-verbiage
pkgver=2.8.4
pkgrel=1
pkgdesc="A GTK+ based IRC client with the ability to add more word to your alerts"
arch=('i686' 'x86_64')
url="http://www.xchat.org/"
license=('GPL')
depends=('gtk2>=2.10.9' 'openssl>=0.9.8b' 'dbus-glib>=0.7.2')
provides=('xchat')
conficts=('xchat')
makedepends=('tcl' 'perl' 'python')
options=('!libtool')
source=(http://www.xchat.org/files/source/2.8/xchat-${pkgver}.tar.bz2 highlight.patch)
md5sums=('66d60febc62a01bafac9bb3a35fb37ae''782a3864200c11fdddb0b7d5c7706dd4')

build() {
  cd ${startdir}/src/xchat-${pkgver}
  patch -Np0 -i $startdir/src/highlight.patch
  ./configure --prefix=/usr --sysconfdir=/etc \
              --enable-openssl --enable-dbus \
              --disable-gnome --disable-textfe \
	      --enable-ipv6 --enable-shm \
	      --enable-spell=none
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
