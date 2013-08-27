# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit.com>

pkgname=mosh-server
pkgver=1.2.4
pkgrel=1
pkgdesc='Mobile shell, surviving disconnects with local echo and line editing (server component only)'
arch=('x86_64' 'i686')
url='http://mosh.mit.edu/'
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'libutempter')
source=("http://mosh.mit.edu/mosh-$pkgver.tar.gz")
sha256sums=('e74d0d323226046e402dd469a176075fc2013b69b0e67cea49762c957175df46')
optdepends=('ufw-extras' 'openssh')
options=('!emptydirs')
conflicts=('mosh')

build() {
  cd "$srcdir/mosh-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr --disable-client
  make
}

package() {
  cd "$srcdir/mosh-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
