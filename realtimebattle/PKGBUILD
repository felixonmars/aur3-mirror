# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: [eXr] <exr at vortexr dot es>
pkgname=realtimebattle
pkgver=1.0.8
pkgrel=3
pkgdesc="A programming game, in which robots controlled by programs are fighting each other. The goal is to destroy the enemies, using the radar to examine the environment and the cannon to shoot."
arch=('i686 x86_64')
url="http://realtimebattle.sourceforge.net/"
license=('GPL2')
depends=(gtk2)
install=realtimebattle.install
source=(http://downloads.sourceforge.net/realtimebattle/RealTimeBattle-$pkgver-Ext.tar.bz2
        debian.diff.gz::http://ftp.debian.org/debian/pool/main/r/realtimebattle/realtimebattle_1.0.8-13.diff.gz
        eof-is-undefined.patch)
md5sums=('5d4d7cfc0628f8e106bcfa052af94db8'
         '3d771cfde53ad13d8f861f187ef2fd6a'
         '9bba77caae4ab729d22ba9ca71c693c1')

build() {
  cd RealTimeBattle-${pkgver}-Ext

  patch -p1 < "$srcdir"/debian.diff
  patch -p1 < "$srcdir"/eof-is-undefined.patch
  ./configure --prefix=/usr --infodir=/usr/share/info --with-python=/usr/bin/python2
  make
}

package() {
  cd RealTimeBattle-${pkgver}-Ext

  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/share/locale/locale.alias
}

