# Maintainer: Daniel Narvaez <dwnarvaez@gmail.com> 

pkgname=sugar-toolkit-gtk3-git
pkgver=v0.99.4.0.g2d33c92
pkgrel=1
pkgdesc="Toolkit library for Sugar"
arch=('i686' 'x86_64')
url="http://sugarlabs.org/"
license=('LGPL')
depends=('python2' 'gtk3' 'librsvg' 'gconf' 'alsa-utils' 'sugar-artwork-git'
         'sugar-datastore-git' 'gobject-introspection' 'xorg-server'
         'python2-decorator' 'python2-dbus' 'python2-gobject'
         'telepathy-gabble' 'telepathy-salut' 'telepathy-mission-control'
         'python2-telepathy' 'python2-dateutil')
makedepends=('git' 'intltool')
source=("$pkgname"::'git://github.com/sugarlabs/sugar-toolkit-gtk3.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver="$(git describe --tags --long)"
  printf "%s" "${ver//-/.}"
}

build() {
  cd ${srcdir}/${pkgname}
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR="$pkgdir" install
}
