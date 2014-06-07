# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Constantin Schomburg <me@xconstruct.net>

_srcpkgname=overlay-scrollbar
pkgname=liboverlay-scrollbar-bzr
pkgver=r383
pkgrel=1
pkgdesc="Overlay scrollbar widget for GTK+ 2 (Canonical Ayatana Project) (bzr version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/ayatana-scrollbar"
license=('GPL')
depends=('gtk2-ubuntu')
makedepends=('automake' 'bzr')
provides=('liboverlay-scrollbar')
conflicts=('liboverlay-scrollbar')
install=$_srcpkgname.install
source=('bzr+lp:overlay-scrollbar')
sha512sums=('SKIP')

pkgver() {
  cd $_srcpkgname

  printf "r%s" "$(bzr revno)"
}

build() {
  cd "$srcdir/$_srcpkgname"
  ./autogen.sh --disable-static --prefix=/usr --sysconfdir=/etc --with-gtk=2
  make
}

package() {
  cd "$srcdir/$_srcpkgname"
	make DESTDIR="$pkgdir" install
	rm "$pkgdir/etc/X11/Xsession.d/81overlay-scrollbar"
}
