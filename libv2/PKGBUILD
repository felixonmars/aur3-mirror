# Contributor: Lex Rivera <x-demon@x-demon.org>
pkgname=libv2
pkgver=1.11
pkgrel=1
pkgdesc="library with different classes for data structures, daemons, mysql, sockets, cgi, oss (mixer by now) management and much more."
arch=('i686' 'x86_64')
url="http://sorcerynet.org"
license=('GPL2')
depends=()
makedepends=()
optdepends=()
conflicts=()
source=(http://www.sorcerynet.org/downloads/libv2-${pkgver}.tar.gz)

md5sums=('94516d0716a0ef0226d0ce6b0bb1710d')

build() {
  cd $srcdir/voodoo2
  msg "Building sources"
  make || return 1
  msg "Make finished, making tgz dist file"
  make dist_tgz || return 1
  msg "Copying to pkgdir..."
  cp -r /tmp/voodoo2.temp/* ${pkgdir} || return 1
  msg "All done!"
}
# vim:syntax=sh
