# Maintainer: Thomas Oster <thomas.oster@rwth-aachen.de>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Dalius <dagis@takas.lt>

pkgname=wmctrl-with-undecorated-support
conflicts=wmctrl
pkgver=1.07
pkgrel=3
pkgdesc="Control your EWMH compliant window manager from command line with support for the undecorated flag"
url="http://sweb.cz/tripie/utils/wmctrl/"
arch=('i686' 'x86_64')
license=('GPL')
depends=(libxmu glib2)
source=(http://sweb.cz/tripie/utils/wmctrl/dist/wmctrl-$pkgver.tar.gz
        http://ftp.de.debian.org/debian/pool/main/w/wmctrl/wmctrl_$pkgver-6.diff.gz wmctrl_undecorated.patch)
md5sums=('1fe3c7a2caa6071e071ba34f587e1555'
         '7ddf2aadc48f4300c16160b3c9a7e141'
	 '1722c084397cf5d2f5b6fb8333a90ed6')


build() {
  cd "$srcdir/wmctrl-$pkgver"
  patch < ../wmctrl_undecorated.patch
  patch -p1 -i "$srcdir/wmctrl_$pkgver-6.diff"
  ./configure --prefix=/usr --mandir=$pkgdir/usr/share/man
  make
}

package() {
  cd "$srcdir/wmctrl-$pkgver"
  make prefix="$pkgdir/usr" install
}

