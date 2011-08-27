# Maintainer: Kevin Sullivan <ksullivan@archlinux.us>

pkgname=easystroke
pkgver=0.5.5.1
pkgrel=1
pkgdesc="Use mouse gestures to initiate commands and hotkeys."
arch=('i686' 'x86_64')
url="http://easystroke.sourceforge.net/"
license=('custom:ISC')
depends=('gtkmm' 'boost' 'libxtst' 'dbus-glib' 'xorg-server>=1.7.0')
makedepends=('inputproto' 'intltool' 'gettext' 'xorg-server-devel')
optdepends=('help2man: needed to create a manual page')
install=easystroke.install
source=( http://downloads.sourceforge.net/easystroke/$pkgname-$pkgver.tar.gz )
md5sums=('ba989d1745415be94afd567e33d124bb')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Start compilation process with two jobs.
  make -j2

  # Make man page.
  # Note: requires help2man and there is no guarantee this does anything.  In fact,
  #       the produced man pages might need to be manually installed into $pkgdir.
  #make man
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Put files into their respective places
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
