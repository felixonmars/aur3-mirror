# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=qlwm
pkgver=4.3
pkgrel=1
pkgdesc="A Qt based window manager"
arch=(i686)
url="http://www.alinden.mynetcologne.de/qlwm/"
license=('GPL')
depends=(qt)
makedepends=(qt)
provides=(qlwm)
conflicts=(qlwm)
md5sums=('d8337263eb3f8045b8499d19de0d982c')
source=(http://www.alinden.mynetcologne.de/qlwm/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s#/usr/local/bin/qlwm#$pkgdir/usr/bin/qlwm#" Makefile

  make DEST=/usr/share/qlwm MANPATH=/usr/share/man QMAKE=qmake || return 1
  
  install -d -m755 "$pkgdir/usr/share/man/man1"
  install -d -m755 "$pkgdir/usr/bin"
  install -d -m755 "$pkgdir/etc/qlwm"

  make DEST="$pkgdir/usr/share/qlwm" MANPATH="$pkgdir/usr/share/man" install || return 1

#do some cleaning up for hardcoded symlinks
  ln -sf /usr/share/qlwm/qlwm "$pkgdir/usr/bin/qlwm"

  for i in defaults appdefaults menuconfig; \
     do cp  -v files/$i $pkgdir/etc/qlwm; \
  done
}

# vim:set ts=2 sw=2 et:
