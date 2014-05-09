# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Constantin Schomburg <me@xconstruct.net>

_srcpkgname=overlay-scrollbar
pkgname=liboverlay-scrollbar3-bzr
pkgver=r383
pkgrel=1
pkgdesc="Overlay scrollbar widget for GTK+ 3 (Canonical Ayatana Project) (bzr version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/ayatana-scrollbar"
license=('GPL')
depends=('gtk3-ubuntu')
makedepends=('automake' 'bzr')
provides=('liboverlay-scrollbar3')
conflicts=('liboverlay-scrollbar3')
install=$_srcpkgname.install
source=('bzr+lp:overlay-scrollbar')
sha512sums=('SKIP')

pkgver() {
  cd $_srcpkgname

  printf "r%s" "$(bzr revno)"
}

build() {
  cd "$srcdir/$_srcpkgname"
  ./autogen.sh --disable-static --prefix=/usr --sysconfdir=/etc --with-gtk=3
  make
}

package() {
  cd "$srcdir/$_srcpkgname"
	make DESTDIR="$pkgdir" install
	rm "$pkgdir/etc/X11/Xsession.d/81overlay-scrollbar"
}
