# Maintainer: Jan Hrdina <jan dot hrdka at gmail dot com>
# Original Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Kevin Sullivan <ksullivan@archlinux.us>

appname=easystroke
pkgname=${appname}-git
pkgver=20140322
pkgrel=1
pkgdesc='Use mouse gestures to initiate commands and hotkeys.'
arch=('i686' 'x86_64')
url='https://github.com/thjaeger/easystroke'
license=('custom:ISC')
depends=('gtkmm3' 'boost-libs' 'libxtst' 'dbus-glib' 'xorg-server')
makedepends=('boost' 'inputproto' 'intltool' 'gettext' 'xorg-server-devel' 'help2man')
conflicts=('easystroke')
install=easystroke.install
source=("git+https://github.com/thjaeger/easystroke.git")
md5sums=('SKIP')



build() {
  cd ${appname}

  make
  make man
}

package() {
  cd ${appname}

  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -Dm0644 "${appname}.1" "${pkgdir}/usr/share/man/man1/${appname}.1"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${appname}/LICENSE"
}