# Maintainer: Piotr Gorski <sir_lucjan@bridgelinux.pl>

pkgname=xfwm4-4.11
_pkgname=xfwm4
pkgver=4.11.1
pkgrel=1
pkgdesc="Xfce window manager"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui-4.11' 'libwnck' 'hicolor-icon-theme')
makedepends=('intltool')
options=('!libtool')
install=$_pkgname.install
source=(http://archive.xfce.org/src/xfce/$_pkgname/4.11/$_pkgname-$pkgver.tar.bz2)
sha256sums=('1a58e385d4d8dda4d6ac3c7b1e94b3d499bcb78619d91004ffa65a3e6bb58f3e')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")


build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-startup-notification \
    --enable-randr \
    --enable-compositor \
    --enable-xsync \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
