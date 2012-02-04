# The developers of Pidgin removed the ability to resize the conversation entry box, in Pidgin version 2.4.0 and above.
# Fortunately, Artemy Kapitula wrote a plugin that returns this functionality to the program.
# Paul Dwerryhouse now packaged the plugin so that it can be compiled and installed without being part of the Pidgin source code.

# Contributor: David Rosenstrauch <darose@darose.net>
pkgname=pidgin-manualsize
pkgver=0.7
pkgrel=1
pkgdesc="Manual resizing plugin for Pidgin's entry box"
arch=('i686' 'x86_64')
url="http://www.freshports.org/net-im/pidgin-manualsize/"
license=('GPL2')
depends=('pidgin')
# original mirror down as of 2011-10-30
# url="http://issv.org.ru/oss/" 
# source=(http://issv.org.ru/oss/${pkgname}-${pkgver}.tar.bz2)
# md5sums=('b62ebe14fdc2b814f8cb1e9088789b58')
source=(http://wickedmachine.net/~jsa/FreeBSD/distfiles/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b98c69ba35ab182d36e6f3318a62c6c4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  make INSTALL_ROOT="$pkgdir" install
}
