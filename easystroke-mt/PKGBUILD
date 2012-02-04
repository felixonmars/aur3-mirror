# Maintainer: Antonio Chiurla <antoniochiurla.at.gmail.dot.com>
# Contributor: Kevin Sullivan <ksullivan@archlinux.us>

_origpkgname=easystroke
pkgname=easystroke-mt
pkgver=0.5.5.1
pkgrel=3
pkgdesc="Use mouse and screen multitouch gestures to initiate commands and hotkeys."
arch=('i686' 'x86_64')
url="http://easystroke.sourceforge.net/"
license=('custom:ISC')
depends=('gtkmm' 'boost' 'libxtst' 'dbus-glib' 'xorg-server>=1.7.0')
makedepends=('inputproto' 'intltool' 'gettext' 'xorg-server-devel')
optdepends=('help2man: needed to create a manual page')
provides=('easystroke')
conflicts=('easystroke')
install=easystroke-mt.install
source=( http://downloads.sourceforge.net/easystroke/easystroke-$pkgver.tar.gz easystroke_multi_touch3.patch easystroke_tablet.patch)
md5sums=('ba989d1745415be94afd567e33d124bb' '830b30a4b5b78822c1a13adb26892963' '3e862c5bf296b31300ccdaa952c61daf')

build() {
  cd "$srcdir/$_origpkgname-$pkgver"

  patch -p1 < ../../easystroke_tablet.patch
  patch -p1 < ../../easystroke_multi_touch3.patch

  # Start compilation process with two jobs.
  make -j2

  # Make man page.
  # Note: requires help2man and there is no guarantee this does anything.  In fact,
  #       the produced man pages might need to be manually installed into $pkgdir.
  #make man
}

package() {
  cd "$srcdir/$_origpkgname-$pkgver"

  # Put files into their respective places
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  install -D -m644 ${srcdir}/${_origpkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${_origpkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
