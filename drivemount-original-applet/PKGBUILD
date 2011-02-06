# Contributor: Artiom Molchanov <ar.molchanov@gmail.com>
pkgname=drivemount-original-applet
pkgver=2.10.0
pkgrel=1
pkgdesc="The original drive mount panel applet for the GNOME panel"
arch=(i686 x86_64)
url="http://gqapplets.sourceforge.net/applet-mount.html"
license=('GPL')
groups=()
depends=(gnome-panel)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://prdownloads.sourceforge.net/gqapplets/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('ea4e4f0f2f6e8cb0d7524d49ec1d3cd5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --libexecdir=/usr/lib/gnome-applets/
  make || return 1
  make DESTDIR="$pkgdir" install
}

