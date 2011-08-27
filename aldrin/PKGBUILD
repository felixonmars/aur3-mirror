# Contributor: Berkus <berkus@madfire.net>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Sébastien Piccand <sebcactus gmail com>

pkgname=aldrin
pkgver=0.13
pkgrel=1
pkgdesc="A Buzz-like tracker"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.aldrin.eu"
makedepends=('scons')
depends=('pygtk' 'armstrong')
source=(http://aldrin-sequencer.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('6bdbd4a48883cc7d4734fef3055947b2')

build() {
  cd $srcdir/$pkgname
  scons install PREFIX=/usr DESTDIR=${pkgdir} || return 1
}
