# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Michal Gawronski <dinth1906@gmail.com>

pkgname=indicator-application-bzr
_bzrname=indicator-application
pkgver=248
pkgrel=4
pkgdesc="A library and indicator to take menus from applications and place them in the panel. (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-application"
license=('GPL')
depends=('dbus-glib' 'json-glib' 'libappindicator-bzr')
makedepends=('bzr')
provides=('indicator-application')
conflicts=('indicator-application')
source=("$_bzrname::bzr+http://bazaar.launchpad.net/~indicator-applet-developers/$_bzrname/trunk.14.04/"
        '0001_autoconf.patch'
        'indicator-application.service')
md5sums=('SKIP'
         'b75cdcad19c6381714b1f816ddc04981'
         'a86cc936716d68a605e3d2192afe92cb')

pkgver() {
  cd $_bzrname
  bzr revno
}

prepare() {
  cd "$srcdir"/$_bzrname

  patch -p1 -i "${srcdir}/0001_autoconf.patch"
}

build() {
  cd ${srcdir}/$_bzrname
 
  ./autogen.sh --prefix=/usr --disable-static
  make
}

package() {
  cd ${srcdir}/$_bzrname
  make DESTDIR="$pkgdir" install

  install -dm755 "${pkgdir}/usr/share/dbus-1/services/"
  install -m644 "${srcdir}/indicator-application.service" \
                "${pkgdir}/usr/share/dbus-1/services/"
}
