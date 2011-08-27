# Contributor: Denis Zawada <deno@rootnode.net>

pkgname=libowl-av
pkgver=0.1
pkgrel=1
pkgdesc="libowl-av (OpenedHand Widget Library - Audio/Video) is a collection of objects for use in multimedia applications"
arch=('i686' 'x86_64')
url="http://labs.o-hand.com/av-widget-library/"
license=('LGPL')
groups=()
depends=('gtk2' 'gstreamer0.10' 'gstreamer0.10-base')
makedepends=('gtk-doc' 'pkgconfig' 'vala>=0.3.1')
optdepends=()
provides=()
conflicts=('')
replaces=()
backup=()
options=()
install=
source=("http://labs.o-hand.com/sources/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('b825c1f36e3cf11876df97a910a04a9c')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
