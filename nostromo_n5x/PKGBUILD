# Maintainer: Badmotorfinger <paul@bohme.org>
# Contributor: Paul Bohme <paul@bohme.org>
pkgname=nostromo_n5x
pkgver=1.4.1
pkgrel=3
pkgdesc="Configuration GUI and daemon to support Belkin Nostromo N50 and N52 game devices."
arch=(i686, x86_64)
url="http://www.bohme.org/?b=nostromo_n50"
license=('GPL')
groups=
provides=()
depends=('fltk')
makedepends=('fltk')
conflicts=()
replaces=()
backup=()
install=
source=(http://www.bohme.org/files/nostromo_n50-$pkgver.tar.gz \
        nostromo_n5x-config.desktop \
        nostromo_n5x-daemon.desktop)
sha1sums=('39e97150f71d07ebdc8af602621334d92355c659' \
         'e1e4d18f6357a564549b0ed4ccf20bcbce6ab825' \
         '0e5914fb91129c94daf790acf25262d05e99e717')

build() {
  cd $srcdir/nostromo_n50-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/nostromo_n50-$pkgver
  make prefix=$pkgdir/usr install
  cd ${startdir}/src
  install -Dm644 $pkgname-config.desktop $pkgdir/usr/share/applications/$pkgname-config.desktop
  install -Dm644 $pkgname-daemon.desktop $pkgdir/usr/share/applications/$pkgname-daemon.desktop
}

