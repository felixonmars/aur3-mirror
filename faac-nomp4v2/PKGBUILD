# Contributor: Erol Grahm <erol at grahm dot nu>
pkgname=faac-nomp4v2
pkgver=1.28
pkgrel=2
pkgdesc="FAAC is an AAC audio encoder built with --with=mp4v2=no option."
arch=('i686')
url="http://www.audiocoding.com/faac.html"
license=('GPL2')
depends=('glibc')
provides=('faac')
conflicts=('faac')
source=(http://downloads.sourceforge.net/faac/faac-$pkgver.tar.gz)
md5sums=('80763728d392c7d789cde25614c878f6')

build() {
  cd $srcdir/faac-$pkgver
  ./bootstrap --with=mp4v2=no
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
