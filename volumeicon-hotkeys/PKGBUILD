# Contributor: David Gidwani <david.gidwani@gmail.com>
# Author: Maato <maato softwarebakery com>
pkgname=volumeicon-hotkeys
pkgver=0.3.0
pkgrel=1
pkgdesc="Patched volumeicon to support hotkeys."
arch=('i686' 'x86_64')
url="http://www.softwarebakery.com/maato/volumeicon.html"
license=('GPL3')
conflicts=('volumeicon')
replaces=('volumeicon')
depends=('gtk2>=2.16.0' 'alsa-lib' 'libkeybinder')
source=(http://www.softwarebakery.com/maato/files/volumeicon/volumeicon-$pkgver.tar.gz hotkeys.patch)
md5sums=('803f2a376f6ddcb10fb4ca979baf3ef1'
         'e20ab1b41d04175d6b4045b5d140063e')

build() {
  cd "$srcdir/${pkgname%-*}-$pkgver"

  patch -Np1 < $srcdir/hotkeys.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
