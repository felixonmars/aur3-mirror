#
# Contributor: thoughtcrime
#
# $pkgver is the "last modified" date from:
# http://opengeu.linuxfreedom.com/opengeu-testingstuff/files/e17-apps/
#

pkgname=e17-settings-daemon
pkgver=20100307
pkgrel=1
pkgdesc="Sets up GTK2 at runtime, it does not depend on E17"
arch=(x86_64 i686)
url="http://opengeu.intilinux.com/"
license=('GPL')
source=(http://opengeu.linuxfreedom.com/opengeu-testingstuff/files/e17-apps/$pkgname.tar.bz2)
md5sums=('c18f2ebd05954809364a296f8990d849')

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
