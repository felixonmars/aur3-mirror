# Maintainer: Rick W. Chen <stuffcorpse@archlinux.us>
# Maintainer: damian01w <damian01w@gmail.com>
pkgname=kerneloops
pkgver=0.12
pkgrel=2
pkgdesc="Kernel oops crash sender"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.kerneloops.org"
depends=('curl' 'gtk2' 'libnotify' 'dbus-glib')
source=(http://www.kerneloops.org/download/$pkgname-$pkgver.tar.gz
        fix_build.patch)
sha1sums=('0dc86cff83fe3e91068a2d069fe4282c02cbbe22'
          '90450520638b0999cc1966cff40a9cfbb01ed69a')
md5sums=('97e611e5b09831cb6ee31c31bf2bc286'
         'dd2afe82266552e335739102d565651d')

build() {
  cd $srcdir/$pkgname-$pkgver/
  patch -Np1 -i $srcdir/fix_build.patch
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  mkdir -p $pkgdir/etc/xdg/autostart
  make DESTDIR=$pkgdir install
}
