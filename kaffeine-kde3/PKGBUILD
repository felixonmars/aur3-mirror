# Contributor: Jon Monteiro <jam436@cs.drexel.edu>
# Maintainer: Jon Monteiro <jam436@cs.drexel.edu>
# Modified from the old kaffeine 0.8.8 PKGBUILD from the extra repository

pkgname=kaffeine-kde3
pkgver=0.8.8
pkgrel=1
pkgdesc="Multimedia Player, based on Xine (KDE3 Version)"
arch=('i686' 'x86_64')
url="http://kaffeine.sourceforge.net/"
license=('GPL')
depends=('kdelibs3' 'libxtst' 'xine-lib' 'libcdio')
makedepends=('kernel-headers>=2.6.30')
options=('libtool')
source=(http://hftom.free.fr/kaffeine-$pkgver.tar.bz2)
noextract=()
md5sums=('d0ce08113e94c0b31f69d2bbf8974515')

build() {
  cd "$srcdir/kaffeine-$pkgver"

  . /etc/profile.d/qt3.sh
  . /etc/profile.d/kde3.sh


  ./configure --prefix=/opt/kde --without-arts --without-gstreamer --enable-final
  make || return 1
  make DESTDIR="$pkgdir/" install

  #From old extra package
  rm $pkgdir/opt/kde/share/mimelnk/application/x-mplayer2.desktop

}
