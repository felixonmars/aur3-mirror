# Contributor: eKoeS <my.ekoes@gmail.com>

pkgname=gnome-compiz-manager
pkgver=0.10.4
pkgrel=1
pkgdesc="A small utility which manage GL Desktop configuration on XGL/AiGLX."
arch=('i686' 'x86_64')
url="http://gandalfn.wordpress.com/gnome-compiz-manager/"
license=('GPL' 'LGPL')
groups=
provides=
depends=('compiz-core' 'gnome-desktop' 'librsvg' 'libwnck')
makedepends=('gob2')
conflicts=()
replaces=()
backup=()
install=()
source=(http://download.gna.org/gcm/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('654041b7bf9869e7d1724cb90739cdef')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-gnome-session
  make || return 1
  make DESTDIR=$startdir/pkg install
}
