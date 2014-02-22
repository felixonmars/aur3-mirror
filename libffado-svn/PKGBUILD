# Maintainer: Ray Rashif <schiv@archlinux.com>
# Contributor: galiyosha@gmail.com
# Contributor: Jon Kristian Nilsen <jokr.nilsen@gmail.com>

pkgname=libffado-svn
pkgver=2480
pkgrel=1
pkgdesc="Driver for FireWire audio devices (development version)"
arch=('i686' 'x86_64')
url="http://www.ffado.org/"
license=('GPL')
depends=('libiec61883' 'libavc1394' 'libsigc++'
         'libxml++' 'alsa-lib' 'dbus-c++' 'libconfig')
makedepends=('subversion' 'scons' 'python2-pyqt')
optdepends=('python2-pyqt: mixer applet')
provides=('libffado')
conflicts=('libffado' 'ffado-svn')
replaces=('ffado-svn')
source=('libffado::svn+http://subversion.ffado.org/ffado/trunk/libffado'
        'python2-qt.patch')
md5sums=('SKIP'
         'acb6e0dca1239850c7862bf2e1443fd7')

_scons-conf() {
  scons DEBUG=True \
        PREFIX=/usr \
        MANDIR=/usr/share/man \
        UDEVDIR=/usr/lib/udev/rules.d \
        COMPILE_FLAGS="$CFLAGS" \
        ENABLE_OPTIMIZATIONS=True $@
}

pkgver() {
  cd libffado
  svnversion
}

prepare() {
  cd libffado

  # python2 fix
  patch -Np1 -i "$srcdir/python2-qt.patch"
}

build() {
  cd libffado

  _scons-conf
}

package() {
  cd libffado

  scons DESTDIR="$pkgdir" WILL_DEAL_WITH_XDG_MYSELF="True" install

  # desktop files & icons
  install -Dm644 support/xdg/ffado.org-ffadomixer.desktop \
    "$pkgdir/usr/share/applications/ffadomixer.desktop"

  install -Dm644 support/xdg/hi64-apps-ffado.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
