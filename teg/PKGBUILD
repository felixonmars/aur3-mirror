# Maintainer: DonVla <donvla@users.sourceforge.net>

pkgname=teg
pkgver=0.11.2.r1.gd9ae386
pkgrel=1
pkgdesc="Tenes Empanadas Graciela - A risk clone for Gnome 2"
arch=(i686 x86_64)
url="https://github.com/wfx/teg"
license=('GPL')
depends=('libgnomeui>=2.18.1-2')
makedepends=('git' 'intltool' 'pkgconfig')
source=("$pkgname::git+git://github.com/wfx/${pkgname}")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"

  rm -rf "$srcdir/$pkgname-build"
  git clone "$srcdir/$pkgname" "$srcdir/$pkgname-build"
  cd "$srcdir/$pkgname-build"

  #
  # BUILD HERE
  #
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --with-readline
  make
}

package() {
  cd "$srcdir/$pkgname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
