# Contributor: Claudio Riva <firetux83@gmail.com>

pkgname=gnubversion
pkgver=0.5
pkgrel=1
pkgdesc="GNOME interface to Subversion"
arch=('i686')
url="https://sourceforge.net/projects/gnubversion"
license=('GPL')
depends=('subversion' 'nautilus' )
options=(!libtool)
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('e97e65eb15dcffe2665a6a8f609bac6a')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
